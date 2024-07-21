module tb_keyreg;
reg clk;
reg reset;
reg [3:0]key;
reg shift;
wire [3:0]key_buffer_ms_hr,key_buffer_ls_hr,key_buffer_ms_min,key_buffer_ls_min;

integer i;

keyreg u1(clk,reset,key,shift,key_buffer_ms_hr,key_buffer_ls_hr,key_buffer_ms_min,key_buffer_ls_min);

always 
begin
#5 clk=0;
#5 clk =1;
end

initial
begin
{reset,shift,key} = 6'b000000;
for(i=0;i<64;i=i+1)
begin
	#10 {reset,shift,key} = i;
end
/*
#3 key = 4'bd1;shift = 1'b1;
#10 key = 4'bd2;
#10 key = 4'bd4;
#10 key = 4'bd3;
#10 shift = 0; key = 4'bd9;
#10 key = 4'bd4;shift = 1'b1;reset=4'bd0*/

end

initial 
begin
$monitor($time,"%d %d : %d %d",key_buffer_ms_hr,key_buffer_ls_hr,key_buffer_ms_min,key_buffer_ls_min);
end

endmodule