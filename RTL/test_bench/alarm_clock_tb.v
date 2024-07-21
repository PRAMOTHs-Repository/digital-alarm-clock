module alarm_clock_tb;
reg clk;  			//256hz
reg reset; 			//AH asynchronous 
reg alarm_button;	//AH control for setting the alarm time
reg time_button; 	//AH control for setting the current time
reg [3:0]key;		//key reg
reg fast_watch;    //clk runs faster is set
wire sound_alarm;
wire [7:0]display_ms_hr;
wire [7:0]display_ls_hr;
wire [7:0]display_ms_min;
wire [7:0]display_ls_min;  

alarm_clock u1(
 clk,  			//256hz
 reset, 			//AH asynchronous 
 alarm_button,	//AH control for setting the alarm time
 time_button, 	//AH control for setting the current time
 key,		//key input
 fast_watch,    //clk runs faster is set
 sound_alarm,
 display_ms_hr,
 display_ls_hr,
 display_ms_min,
 display_ls_min);

always 
begin

#5 clk =~clk;

end

initial 
begin
clk =0;reset=1;
#10 reset=0;
#50 alarm_button = 1'b1;
#10 alarm_button = 1'b0;
#20 key = 4'd0;
#20 key = 4'd1;
#20 key = 4'd0;
#20 key = 4'd0;
end

endmodule


