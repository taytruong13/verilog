module ripple_carry_adder #(parameter WIDTH = 4)(
	input [WIDTH-1:0] a,
	input [WIDTH-1:0] b,
	input cin,
	output [WIDTH-1:0] sum, cout
	);
	
	genvar g;
	//First full adder
	full_adder fa0(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(cout[0]));
	//2nd, 3rd, ... full adder generation
	generate
		for(g=1; g<WIDTH; g=g+1) begin
			full_adder fa(
					.a(a[g]),.b(b[g]),.cin(cout[g-1]),
					.sum(sum[g]),
					.cout(cout[g]));
		end
	endgenerate
endmodule 

// full adder module
module full_adder(
	input a, b, cin,
	output sum, cout
	);
	assign sum = a^b^cin;
	assign cout = (a&b)|(a&cin)|(b&cin);
endmodule