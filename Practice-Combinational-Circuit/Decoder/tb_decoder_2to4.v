`timescale 1ns/1ps
module tb_decoder_2to4();
	reg [1:0] in;
	wire [3:0] out;
	
	decoder_2to4 dut(.in(in),.out(out));
	
	initial begin
		$display("**Decoder 2 to 4**");
		$monitor("in = %b, out = %b", in, out);

		in = 2'b00;
		#5 in = 2'b01;
		#5 in = 2'b10;
		#5 in = 2'b11;
		#5 in = 2'b00;
		#5 $stop;
	end
endmodule