module alarm_clock(
input clk,  			//256hz
input reset, 			//AH asynchronous 
input alarm_button,	//AH control for setting the alarm time
input time_button, 	//AH control for setting the current time
input [3:0]key,		//key input
input fast_watch,    //clk runs faster is set
output sound_alarm,
output [7:0]display_ms_hr,
output [7:0]display_ls_hr,
output [7:0]display_ms_min,
output [7:0]display_ls_min);  

//time generator 
wire reset_count,one_min,one_sec;

//alarm controller
wire load_new_c,load_new_a,show_a,show_new_time,shift;

//key reg
wire [3:0] key_buffer_ms_hr,key_buffer_ls_hr,key_buffer_ms_min,key_buffer_ls_min;

//alarm reg
wire [3:0]alarm_time_ms_hr;
wire [3:0]alarm_time_ls_hr;
wire [3:0]alarm_time_ms_min;
wire [3:0]alarm_time_ls_min;

//counter
wire [3:0]current_time_ms_hr;
wire [3:0]current_time_ls_hr;
wire [3:0]current_time_ms_min;
wire [3:0]current_time_ls_min;

time_generator tg(clk,reset,reset_count,fast_watch,one_min,one_sec);

alarm_controller ac(
 clk,
 reset,
 alarm_button,
 time_button,
 key,
 one_sec,
 load_new_c,
 load_new_a,
 show_a,
 show_new_time,
 shift,
 reset_count);


keyreg kr(clk,reset,key,shift,key_buffer_ms_hr,key_buffer_ls_hr,key_buffer_ms_min,key_buffer_ls_min);

alarm_reg ar(clk,
reset,
load_new_a,
key_buffer_ms_hr,		//new_alarm_ms_hr,
key_buffer_ls_hr,		//new_alarm_ls_hr,
key_buffer_ms_min,		//new_alarm_ms_min,
key_buffer_ls_min,		//new_alarm_ls_min,
alarm_time_ms_hr,
alarm_time_ls_hr,
alarm_time_ms_min,
alarm_time_ls_min);


counter ct(clk,
 reset,
 one_min,
 load_new_c,
key_buffer_ms_hr,
key_buffer_ls_hr,
key_buffer_ms_min,
key_buffer_ls_min,
current_time_ms_hr,
current_time_ls_hr,
current_time_ms_min,
current_time_ls_min);


display_driver dd(current_time_ms_hr,current_time_ls_hr,current_time_ms_min,current_time_ls_min,

alarm_time_ms_hr,alarm_time_ls_hr,alarm_time_ms_min,alarm_time_ls_min,

key_buffer_ms_hr,key_buffer_ls_hr,key_buffer_ms_min,key_buffer_ls_min,

show_new_time,show_a,

sound_alarm,
display_ms_hr,display_ls_hr,display_ms_min,display_ls_min);

endmodule

