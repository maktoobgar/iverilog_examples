`timescale 1ns / 1ps

module PEdge_DFlipFlop_TB;

    // Inputs
    reg D;
    reg clk;
    reg reset;

    // Outputs
    wire Q;
    wire Qbar;

    // Instantiate the Unit Under Test (UUT)
    PEdge_DFlipFlop uut (.Q(Q), .Qbar(Qbar), .D(D), .clk(clk), .reset(reset));

        initial begin

            $dumpfile("test.vcd");
            $dumpvars(0, PEdge_DFlipFlop_TB);
            // Initialize Inputs
            D  = 1'b0;
            clk  = 1'b0;
            reset   = 1'b1;
        
            // Wait 100 ns for global reset to finish
            #100;
        
            reset = 1'b0;
        
            #20;
            forever #40 D = ~ D;
        end

        initial begin
            $monitor("At time %2t: D = %d, clk = %d, reset = %d, Q = %d, Qbar = %d", $time, D, clk, reset, Q, Qbar);
        end
        
        always #10 clk = ~clk;

endmodule


