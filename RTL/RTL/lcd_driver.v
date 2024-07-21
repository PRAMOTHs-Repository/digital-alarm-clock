module lcd_driver(
input show_new_time,
input show_a,
input [3:0]alarm_time,
input [3:0]current_time,
input [3:0]key,
output reg[7:0]display,
output reg sound);

reg [3:0]display_val;

parameter ZERO 	 = 8'h30;
parameter ONE 		 = 8'h31;
parameter TWO 		 = 8'h32;
parameter THREE 	 = 8'h33;
parameter FOUR 	 = 8'h34;
parameter FIVE 	 = 8'h35;
parameter SIX 		 = 8'h36;
parameter SEVEN 	 = 8'h37;
parameter EIGHT 	 = 8'h38;
parameter NINE 	 = 8'h39;
parameter ERROR    = 8'h3A;

always@(*)
begin
	if(show_a)
	begin
		display_val = alarm_time;
	end
	else if(show_new_time)
	begin
		display_val = key;
	end
	else
	begin
		display_val = current_time;
	end
	
	if(current_time == alarm_time)
	begin
		sound = 1'b1;
	end
	else
	begin
		sound = 0;
	end
	
end

always@(display_val)
begin
	case(display_val)
		4'b0000 : display = ZERO;
		4'b0001 : display = ONE;
		4'b0010 : display = TWO;
		4'b0011 : display = THREE;
		4'b0100 : display = FOUR;
		4'b0101 : display = FIVE;
		4'b0110 : display = SIX;
		4'b0111 : display = SEVEN;
		4'b1000 : display = EIGHT;
		4'b1001 : display = NINE;
	   default : display = ERROR;
	endcase
end

endmodule
	
		