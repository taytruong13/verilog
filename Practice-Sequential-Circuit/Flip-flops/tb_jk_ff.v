`timescale 1ns/1ps
module tb_jk_ff();
	reg clk, j, k;
	wire Q;

	jk_ff dut(.clk(clk),.j(j),.k(k),.Q(Q));

always #5 clk = ~clk;

initial begin
	$monitor("At %07t: j = %b, k = %b, Q = %b", $time, j, k, Q);

	clk = 0; j = 0; k = 0;
	#10 j = 1; k = 0; // set
	#10 j = 0; k = 1; // Reset
	#10 j = 1; k = 1; // Toggle
	#10 j = 0; k = 0; // No change
	#10 $stop;
end
endmodule 
	