module carry_lookahead_adder(x, y, result);

	parameter n = 64;

	input [n-1:0] x, y;
	output [n:0] result;

	wire [n-1:0] p, g;
	wire [n:0] c;

	assign c[0] = 1'b0;
	assign result[n] = c[n];

	genvar i;
    genvar j;

	generate
		for(i = 0; i < n; i=i+1)
		begin

			assign p[i] = x[i]|y[i];
			assign g[i] = x[i]&y[i];
			assign c[i+1] = g[i] | (p[i]&c[i]);

		end
	endgenerate

	generate
		for(j = 0; j < n; j=j+1)
		begin

			assign result[j] = x[j] ^ y[j] ^ c[j];

		end
	endgenerate

    assign result[n] = c[n];

endmodule
