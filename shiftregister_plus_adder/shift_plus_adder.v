`include "../adders/64_bit_full_adder.v"
`include "../clockgenerator/clock_generator.v"
`include "../shiftregister/64bitshiftregister.v"

module counter_tb;

    reg [63, 0] in;
    wire [63, 0] out, sum;
    wire [63, 0] q;
    wire clk;

    clockgenerator #(10) cg (.clk(clk));
    carry_lookahead_adder #(64) fa (.in(in), .clk(clk), .SL(1), r(0), .out(out));

endmodule