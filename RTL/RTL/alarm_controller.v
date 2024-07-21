module alarm_controller(
input clk,
input reset,
input alarm_b,
input time_b,
input [3:0]key,
input one_sec,
output load_new_c,
output load_new_a,
output show_a,
output show_c,
output shift,
output reset_counter);

parameter SHOWTIME 	= 3'd0;
parameter SHOW_ALARM = 3'd1;
parameter SET_A 		= 3'd2;
parameter SET_CT 		= 3'd3;
parameter KEY_ENTRY 	= 3'd4;
parameter KEY_STORE 	= 3'd5;
parameter KEY_WAIT 	= 3'd6;
parameter no_key 		= 4'd10;

reg[2:0] STATE,NEXT_STATE;

reg[3:0] count1,count2;

wire timeout;

//count1 
always@(posedge clk)
begin
	if(reset)
		count1 <=  4'd0;
	else if(STATE != KEY_ENTRY)
		count1 <= 4'd0;	
	else if(one_sec)
		count1 <= count1+1'b1;
	else if(count1 == 4'd9)
		count1 <= 4'd0;
end

//count2 for counting 10 sec in key store
always@(posedge clk)
begin
	if(reset)
		count2 <=  4'd0;
	else if(STATE != KEY_ENTRY)
		count2 <=4'd0;	
	else if(one_sec)
		count2 <= count2+1'b1;
	else if(count2 == 4'd9)
		count2 <= 4'd0;
end

assign timout = ((count1==9 )||(count2 == 9)) ? 1:0;

//STATE_logic
always@(STATE or key or alarm_b or time_b or timeout)
begin
	case(STATE)
		SHOWTIME : begin
					  if(alarm_b)
							NEXT_STATE = SHOW_ALARM;
					   else if(key!=no_key)
							NEXT_STATE = KEY_STORE;
						else
							NEXT_STATE = SHOWTIME;
						end
		SHOW_ALARM : begin
						 if(!alarm_b)
							NEXT_STATE = SHOWTIME;
						 else
							NEXT_STATE = SHOW_ALARM;
						 end
		
		KEY_STORE : NEXT_STATE = KEY_WAIT;
		KEY_WAIT  : begin
						if(timeout)
							NEXT_STATE = SHOWTIME;
						else if(key == no_key)
						   NEXT_STATE = KEY_ENTRY;
					   else
							NEXT_STATE = KEY_WAIT;
						end
		KEY_ENTRY : begin
						if(timeout)
							NEXT_STATE = SHOWTIME;
						else if(alarm_b)
							NEXT_STATE = SET_A;
						else if(time_b)
							NEXT_STATE = SET_CT;
						else if(key != no_key)
							NEXT_STATE = KEY_STORE;
						else
							NEXT_STATE = KEY_ENTRY;
						end
						
		SET_A     : NEXT_STATE = SHOWTIME;
		SET_CT    : NEXT_STATE = SHOWTIME;
		default   : NEXT_STATE = SHOWTIME;

	endcase
end

//STATE to nextSTATE
always@(posedge clk)
begin
	if(reset)
		STATE <= SHOWTIME;
	else
		STATE <= NEXT_STATE;
end

//output
assign show_a = (STATE == SHOW_ALARM)?1:0;
assign load_new_c = (STATE == SET_CT)?1:0;
assign load_new_a = (STATE == SET_A)?1:0;
assign shift = (STATE == KEY_STORE)?1:0;
assign reset_counter = (STATE == SET_CT)?1:0;
assign show_c = (STATE == KEY_ENTRY || STATE == KEY_STORE || STATE == KEY_WAIT) ? 1:0;

endmodule
