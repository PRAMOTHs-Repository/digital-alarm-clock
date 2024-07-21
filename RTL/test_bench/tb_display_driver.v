module tb_display_driver;

reg [3:0]current_time_ms_hr;
reg [3:0]current_time_ls_hr;
reg [3:0]current_time_ms_min;
reg [3:0]current_time_ls_min;

reg [3:0]alarm_time_ms_hr;
reg [3:0]alarm_time_ls_hr;
reg [3:0]alarm_time_ms_min;
reg [3:0]alarm_time_ls_min;

reg [3:0]key_ms_hr;
reg [3:0]key_ls_hr;
reg [3:0]key_ms_min;
reg [3:0]key_ls_min;

reg show_new_time;
reg show_a;

wire sound;
wire [7:0]display_ms_hr;
wire [7:0]display_ls_hr;
wire [7:0]display_ms_min;
wire [7:0]display_ls_min;

display_driver u1(current_time_ms_hr,current_time_ls_hr,current_time_ms_min,current_time_ls_min,

alarm_time_ms_hr,alarm_time_ls_hr,alarm_time_ms_min,alarm_time_ls_min,

key_ms_hr,key_ls_hr,key_ms_min,key_ls_min,

show_new_time,show_a,

sound,
display_ms_hr,display_ls_hr,display_ms_min,display_ls_min);

initial 
begin
		{alarm_time_ms_hr,alarm_time_ls_hr,alarm_time_ms_min,alarm_time_ls_min} = 16'h1111;
		{key_ms_hr,key_ls_hr,key_ms_min,key_ls_min} = 16'h2222;
		{current_time_ms_hr,current_time_ls_hr,current_time_ms_min,current_time_ls_min} = 16'h3333;
		
		#10{show_new_time,show_a} = 2'b10;
		
		#10{show_new_time,show_a} = 2'b00;
		
		#10{show_new_time,show_a} = 2'b01;
		#50 $stop;
end
endmodule
