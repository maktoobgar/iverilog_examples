module FullAdder_1Bit(i_1, i_2, i_c, o_s, o_c);

    input i_1, i_2, i_c;
    output o_s, o_c;
    wire w_1, w_2, w_3;

    assign w_1 = i_1 ^ i_2;
    assign o_s = w_1 ^ i_c;
    assign w_2 = w_1 & i_c;
    assign w_3 = i_1 & i_2;
    assign o_c = w_2 | w_3;

endmodule
