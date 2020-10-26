module RisingEdge_DFlipFlop(D,clk,Q);

    input D, clk; 
    output Q;

    always @(posedge clk) 
    begin
        Q <= D; 
    end

endmodule