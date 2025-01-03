`timescale 1ns/1ps
module tb_SR_ff_sync_rst ();
	reg clk, rst, S, R;
	wire Q;

	SR_ff_sync_rst dut(.clk(clk),.rst(rst),.S(S),.R(R),.Q(Q));

initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	$display("** SR Flip flop sync with reset**");
	$monitor("At %t: S = %b, R = %b, rst = %b, Q = %b", $time, S, R, rst, Q);
	rst = 1; S = 0; R = 0;
	#15 rst = 0;
	#10 S = 1; R = 0;
	#10 S = 0; R = 1;
	#10 S = 0; R = 0;
	#10 $stop;
end
endmodule 
	