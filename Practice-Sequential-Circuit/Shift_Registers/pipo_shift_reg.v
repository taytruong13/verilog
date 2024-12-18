//parallel in parallel out shift register
`define D_SIZE 4
module pipo_shift_reg(
	input clk,
	input [`D_SIZE-1:0] din,
	output reg [`D_SIZE-1:0] dout
	);

always @(posedge clk) begin
	dout = din;
end
endmodule