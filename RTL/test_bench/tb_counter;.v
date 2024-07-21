module tb_counter;
reg clk;
reg reset;
reg one_minute;
reg load_new_c;
reg [3:0]new_current_time_ms_hr;
reg [3:0]new_current_time_ls_hr;
reg [3:0]new_current_time_ms_min;
reg [3:0]new_current_time_ls_min;
wire [3:0]current_time_ms_hr;
wire [3:0]current_time_ls_hr;
wire [3:0]current_time_ms_min;
wire [3:0]current_time_ls_min;

always 
begin
#5 clk=1;
#5 clk =0;
end

counter u1(clk,
 reset,
 one_minute,
 load_new_c,
new_current_time_ms_hr,
new_current_time_ls_hr,
new_current_time_ms_min,
new_current_time_ls_min,
current_time_ms_hr,
current_time_ls_hr,
current_time_ms_min,
current_time_ls_min);

initial 
begin
	clk=0;
	reset=0;
	one_minute=0;
	load_new_c=1;
	
	{new_current_time_ms_hr,new_current_time_ls_hr,new_current_time_ms_min,new_current_time_ls_min} = 16'h0;
	
	#20 load_new_c=0;one_minute=1;
end


endmodule
