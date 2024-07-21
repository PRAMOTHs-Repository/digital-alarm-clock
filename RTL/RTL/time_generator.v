module time_generator(
input clk,
input reset,
input reset_count,
input fastwatch,
output reg one_min,
output reg one_sec);

reg [14:0]count = 14'd1;
always@(posedge clk)
begin
if(reset || reset_count)
	begin
		one_min <= 1'b0;
		one_sec <= 1'b0;
		count <= 14'd1;
	end
else if(count%14'd256 == 0 && count!=15360)
	begin
		one_sec <=1'b1;
		count <= count +14'd1;
	end
else if(count == 14'd15360)
	begin
		one_min <=1'b1;
		count <= 14'd1;
	end
else if(fastwatch)
	begin
		one_min <= one_sec;
	end
else
	begin
		count <= count +1;
		one_sec <= 1'b0;
		one_min <= 1'b0;
	end
end

endmodule 