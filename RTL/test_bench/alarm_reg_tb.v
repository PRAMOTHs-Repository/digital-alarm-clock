module alarm_reg_tb;
reg clk;
reg reset;
reg load_new_a;
reg [3:0]new_alarm_ms_hr;
reg [3:0]new_alarm_ls_hr;
reg [3:0]new_alarm_ms_min;
reg [3:0]new_alarm_ls_min;
wire [3:0]alarm_time_ms_hr;
wire [3:0]alarm_time_ls_hr;
wire [3:0]alarm_time_ms_min;
wire [3:0]alarm_time_ls_min;

alarm_reg u1(clk,
reset,
load_new_a,
new_alarm_ms_hr,
new_alarm_ls_hr,
new_alarm_ms_min,
new_alarm_ls_min,
alarm_time_ms_hr,
alarm_time_ls_hr,
alarm_time_ms_min,
alarm_time_ls_min);


always 
begin
#5 clk=0;
#5 clk =1;
end

initial 
begin
	{reset,load_new_a}=2'b01;
	//random values for input output
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'b0;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h1234;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h5678;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h9abc;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'hdef0;
	
	#10 {reset,load_new_a}=2'b00;
	//random values for input output
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'b0;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h1234;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h5678;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h9abc;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'hdef0;
	
	#10 {reset,load_new_a}=2'b11;
	//random values for input output
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'b0;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h1234;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h5678;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h9abc;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'hdef0;
	
	#10 {reset,load_new_a}=2'b10;
	//random values for input output
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'b0;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h1234;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h5678;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'h9abc;
	#10 {new_alarm_ms_hr,new_alarm_ls_hr,new_alarm_ms_min,new_alarm_ls_min} = 16'hdef0;
	end
	
initial
begin
	$monitor($time);
	#300 $stop;
end

endmodule

	
