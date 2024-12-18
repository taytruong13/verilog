`timescale 1ns/1ps
module tb_SR_latch();
	reg S, R;
	wire Q, Qbar;
	SR_latch dut(.S(S),.R(R),.Q(Q),.Qbar(Qbar));

	initial begin
		$display("** SR Latch **");
		$monitor("S = %b, R = %b --> Q = %b, Qbar = %b", S, R, Q, Qbar);
		S = 0; R = 0;
		#5 S = 1; R = 0;
		#5 S = 0; R = 1;
		#5 S = 0; R = 0;
		#5 $stop;
	end
endmodule