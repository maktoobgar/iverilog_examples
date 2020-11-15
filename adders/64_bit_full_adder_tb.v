`include "64_bit_full_adder.v"

module carry_lookahead_adder_tb;

    parameter n = 64;

    reg [n-1:0] x = 0;
    reg [n-1:0] y = 0;

    wire [n:0] result; 

    carry_lookahead_adder carry_lookahead_inst (.x(x), .y(y), .result(result));
    initial begin

        $dumpfile("carry_lookahead_adder_tb.vcd");
        $dumpvars(0, carry_lookahead_adder_tb);

        #10;

        x = 'd64;
        y = 'd64;

        #10;

        x = 'd12;
        y = 'd52;

        #10;

        x = 'd3;
        y = 'd2;

        #10;

        $display("Test Completed!");

    end

    initial begin

        $monitor("At time %2t: x = %d, y = %d, result = %d", $time, x, y, result);

    end

endmodule 
