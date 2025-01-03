`timescale 1ns/1ps
module tb_demux_1x2();
	reg din;
	reg sel;
	wire dout_0;
	wire dout_1;
	
	demux_1x2 dut(.din(din),.sel(sel),.dout_0(dout_0),.dout_1(dout_1));
	
	initial begin 
		$monitor("din = %b, sel = %b, dout_0 = %b, dout_1 = %b", din, sel, dout_0, dout_1);
	end 
	
	initial begin 
			din = 1'b0; sel = 1'b0; 
		#5	din = 1'b0; sel = 1'b1; 
		#5 	din = 1'b1; sel = 1'b0;
		#5 	din = 1'b1; sel = 1'b1;
		#5	din = 1'b0; sel = 1'b0;
		#5 $stop;
	end
endmodule