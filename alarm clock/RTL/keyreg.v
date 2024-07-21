module keyreg
(
input clk,
input reset,
input [3:0]key,
input shift,
output reg [3:0]key_buffer_ms_hr,key_buffer_ls_hr,key_buffer_ms_min,key_buffer_ls_min);

always@(posedge clk)
begin
if(reset)
	begin
		key_buffer_ms_hr   <= 4'b0;
		key_buffer_ls_hr   <= 4'b0;
		key_buffer_ms_min  <= 4'b0;
		key_buffer_ls_min  <= 4'b0;
	end
else if(shift )
	begin
		key_buffer_ls_min  <= key;
		key_buffer_ms_min  <= key_buffer_ls_min;
		key_buffer_ls_hr   <= key_buffer_ms_min;
		key_buffer_ms_hr   <= key_buffer_ls_hr;
	end
end
endmodule

	  