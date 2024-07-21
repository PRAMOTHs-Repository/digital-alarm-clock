module alarm_reg(
input clk,
input reset,
input load_new_a,
input [3:0]new_alarm_ms_hr,
input [3:0]new_alarm_ls_hr,
input [3:0]new_alarm_ms_min,
input [3:0]new_alarm_ls_min,
output reg[3:0]alarm_time_ms_hr,
output reg[3:0]alarm_time_ls_hr,
output reg[3:0]alarm_time_ms_min,
output reg[3:0]alarm_time_ls_min);

always@(posedge clk)
begin
	if(reset)
	begin
		alarm_time_ms_hr <= 4'b0;
		alarm_time_ls_hr <= 4'b0;
		alarm_time_ms_min <= 4'b0;
		alarm_time_ls_min <= 4'b0;
	end
	else if(load_new_a)
	begin
		alarm_time_ms_hr <= new_alarm_ms_hr;
		alarm_time_ls_hr <= new_alarm_ls_hr;
		alarm_time_ms_min <= new_alarm_ms_min;
		alarm_time_ls_min <= new_alarm_ls_min;	
	end
	/*else
	begin
		alarm_time_ms_hr <= alarm_time_ms_hr;
		alarm_time_ls_hr <= alarm_time_ls_hr;
		alarm_time_ms_min <= alarm_time_ms_min;
		alarm_time_ls_min <= alarm_time_ls_min;	
	end*/
end
endmodule
	
		
		