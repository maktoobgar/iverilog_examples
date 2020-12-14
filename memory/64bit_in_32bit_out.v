module Ram_64bit (clk, rOrw, data_in, addr_in, data_out);
    
    input rOrw, clk;
    input [31: 0] data_in;
    input [63: 0] addr_in;
    output [31: 0] data_out;
    reg [31: 0] data_out_reg;
    reg [63: 0]data[31: 0];
    reg i;

    initial begin
        for(i=0; i<64; i=i+1)
            data[i] <=2'd1;
    end

	always @(posedge clk)
	begin

		if (rOrw == 'd1)
			data[addr_in] = data_in;
            
		else
			data_out_reg = data[addr_in];	

	end
    
    assign data_out = data_out_reg;

endmodule
