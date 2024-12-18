// 1x8 demux
// 1x2mux|SIZE=1; 1x4mux|SIZE=2; 1x8mux|SIZE=3; 1x16mux|SIZE=4...
module demux_1x8 #(parameter SIZE=3) (
	input wire din,
	input wire [SIZE-1:0] sel,
	output wire [(1<<SIZE)-1:0] dout
	);
	genvar g;
	generate 
		for(g=0; g<(1<<SIZE); g=g+1) begin : gen_demux //named generate block
			assign dout[g] = (sel == g[SIZE-1:0]) ? din : 1'b0;
		end
	endgenerate
endmodule