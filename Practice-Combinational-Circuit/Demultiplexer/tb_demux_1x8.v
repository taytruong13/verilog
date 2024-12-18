//Testbend for Demux SIZE = 3 (1x8)
`define D_SIZE 3
module tb_demux_1x8();
	reg din;
	reg [`D_SIZE-1:0] sel;
	wire [(1<<`D_SIZE)-1:0] dout;
	integer i;
	
	demux_1x8 #(`D_SIZE) dut(.din(din),.sel(sel),.dout(dout));
	
	initial begin
		$monitor("din = %b, sel = %d, dout[%01d-0] = %b", din, sel, ((1<<`D_SIZE)-1), dout);
	end
	
	initial begin
		din = 1'b0; 
		sel = 0;
		#5;
		din = 1'b1;
		for(i=0; i<(1<<`D_SIZE); i=i+1) begin
			sel = i[(1<<`D_SIZE)-1:0];
			#5;
		end
		din = 1'b0;
		sel = 0;
		#5 $stop;
	end
endmodule 