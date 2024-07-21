module time_generate_tb;
reg clk,reset,reset_count,fast_watch;
reg [3:0]key;
wire one_min,one_sec,sound_alarm;

time_generator u1(clk,reset,reset_count,fast_watch,one_min,one_sec);
/*alarm_clock u2(clk,reset,alarm_button,time_button,key,fastwatch, sound_alarm,
 display_ms_hr,
 display_ls_hr,
 display_ms_min,
 display_ls_min);*/
initial 
begin 
clk =0;
reset=0;
reset_count = 0;
fast_watch = 0;
end

always 
begin
#5 clk=0;
#5 clk =1;
end

initial 
begin
$monitor($time);
end

endmodule

