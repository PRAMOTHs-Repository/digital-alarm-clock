module counter(
input clk,
input reset,
input one_minute,
input load_new_c,
input [3:0]new_current_time_ms_hr,
input [3:0]new_current_time_ls_hr,
input [3:0]new_current_time_ms_min,
input [3:0]new_current_time_ls_min,
output reg[3:0]current_time_ms_hr,
output reg[3:0]current_time_ls_hr,
output reg[3:0]current_time_ms_min,
output reg[3:0]current_time_ls_min);

always@(posedge clk)
begin
	if(reset)
	begin
		current_time_ms_hr <= 4'b0;
      current_time_ls_hr <= 4'b0;
		current_time_ms_min <= 4'b0;
		current_time_ls_min <= 4'b0;
	end
	else if(load_new_c)
	begin
		current_time_ms_hr <= new_current_time_ms_hr;
      current_time_ls_hr <= new_current_time_ls_hr;
		current_time_ms_min <= new_current_time_ms_min;
		current_time_ls_min <= new_current_time_ls_min;
		
	end
	else if(one_minute)
	begin
	if({current_time_ms_hr,current_time_ls_hr,current_time_ms_min,current_time_ls_min} == 16'h2359)
	begin
		{current_time_ms_hr,current_time_ls_hr,current_time_ms_min,current_time_ls_min} <= 16'h0;
	end
	else if({current_time_ls_hr,current_time_ms_min,current_time_ls_min} == 12'h959)
	begin
		{current_time_ls_hr,current_time_ms_min,current_time_ls_min} <= 12'b0;
		current_time_ms_hr <= current_time_ms_hr+1;
	end
	else if({current_time_ms_min,current_time_ls_min} == 8'h59)
	begin
		{current_time_ms_min,current_time_ls_min} <= 8'b0;
		current_time_ls_hr <= current_time_ls_hr+1;
	end
	else if(current_time_ls_min == 4'd9)
	begin
		current_time_ms_min <= current_time_ms_min+1;
		current_time_ls_min <= 4'd0;
	end
	else
	begin
		current_time_ls_min <= current_time_ls_min + 1;
	end
	end	
end
endmodule
