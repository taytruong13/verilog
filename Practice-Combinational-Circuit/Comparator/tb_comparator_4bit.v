`timescale 1ns/1ps
module tb_comparator_4bit();
	reg [3:0] inA, inB;
	wire A_eq_B, A_lt_B, A_gt_B;
	integer i;

	comparator_4bit dut(.inA(inA),.inB(inB),
				.A_eq_B(A_eq_B),.A_lt_B(A_lt_B),.A_gt_B(A_gt_B));
	
	initial begin
		$display("** 4 Bit Comparator **");
		$monitor("A = %b, B = %b --> [equal,less,greater] = [%b,%b,%b]", inA, inB,A_eq_B, A_lt_B, A_gt_B);
		inA = 4'b0000; inB = 4'b0000;
		#10 inA = 4'b0111;
		for(i = 0; i < 16; i= i+1) begin
			inB = i;
			#10;
		end
		$stop;
	end
endmodule 