`include "1_bit_full_adder.v"

module FullAdder_1Bit_TB;

    reg i_1;
    reg i_2;
    reg i_c;

    wire o_s;
    wire o_c;

    FullAdder_1Bit uut (.i_1(i_1), .i_2(i_2), .i_c(i_c), .o_s(o_s), .o_c(o_c));

        initial begin

            $dumpfile("test.vcd");
            $dumpvars(0, FullAdder_1Bit_TB);

            i_1 = 1'b0;
            i_2 = 1'b0;
            i_c = 1'b0;

            #10
            i_1 = 1'b1;

            #10
            i_c = 1'b1;

            #10
            i_2 = 1'b1;

            #10
            $finish;

        end

        initial begin

            $monitor("At time %2t: i_1 = %d, i_2 = %d, i_c = %d, o_c = %d, o_s = %d", $time, i_1, i_2, i_c, o_c, o_s);

        end

endmodule
