module PEdge_DFlipFlop(D, clk, reset, Q, Qbar);

    input D, clk, reset;
    output reg Qbar;
    output Q;

    assign Q = ~Qbar;

    always @(posedge clk)
    begin
        if (reset == 1'b1)
            Qbar = 1'b1;
        else
            Qbar = ~D;
    end

endmodule
