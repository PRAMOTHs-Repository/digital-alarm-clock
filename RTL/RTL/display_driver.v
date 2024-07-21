module display_driver(
input [3:0]current_time_ms_hr,
input [3:0]current_time_ls_hr,
input [3:0]current_time_ms_min,
input [3:0]current_time_ls_min,

input [3:0]alarm_time_ms_hr,
input [3:0]alarm_time_ls_hr,
input [3:0]alarm_time_ms_min,
input [3:0]alarm_time_ls_min,

input [3:0]key_ms_hr,
input [3:0]key_ls_hr,
input [3:0]key_ms_min,
input [3:0]key_ls_min,

input show_new_time,
input show_a,

output sound,
output [7:0]display_ms_hr,
output [7:0]display_ls_hr,
output [7:0]display_ms_min,
output [7:0]display_ls_min);

wire sound_ms_hr,sound_ls_hr,sound_ms_min,sound_ls_min;
assign sound = sound_ms_hr & sound_ls_hr & sound_ms_min &  sound_ls_min;

lcd_driver u1(show_new_time,show_a,alarm_time_ls_min,current_time_ls_min,key_ls_min,display_ls_min,sound_ls_min);
lcd_driver u2(show_new_time,show_a,alarm_time_ms_min,current_time_ms_min,key_ms_min,display_ms_min,sound_ms_min);
lcd_driver u3(show_new_time,show_a,alarm_time_ls_hr,current_time_ls_hr,key_ls_hr,display_ls_hr,sound_ls_hr);
lcd_driver u4(show_new_time,show_a,alarm_time_ms_hr,current_time_ms_hr,key_ls_hr,display_ms_hr,sound_ms_hr);

endmodule
