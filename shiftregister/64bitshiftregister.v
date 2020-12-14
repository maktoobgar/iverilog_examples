module SixtyFourBitShiftRegister (in, clk, SL, r, out);

    input in, clk;
    input reg SL, r;
    output reg out;
    reg [63:0] bits;

    always @ (posedge clk)
        if (r) begin

            bits <= 0;
            out <=0;

        end
        else begin
            if (SL) begin

                bits <= bits << 1'b1;
                bits[63] <= in;
                out = bits[0];

            end
            else begin

                bits <= bits >> 1'b1;
                bits[0] <= in;
                out <= bits[63];

            end
        end
endmodule