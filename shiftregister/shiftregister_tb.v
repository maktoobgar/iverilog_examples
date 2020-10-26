module ShiftLR_TB;

    reg clk;
    reg SI;
    reg LR;

    wire SOL;
    wire SOR;

    ShiftLR uut (.clk(clk), .SI(SI), .LR(LR), .SOL(SOL), .SOR(SOR));

        initial begin

            clk = 1'b0;
            SI  = 1'b1;
            LR  = 1'b1;

            #50

            forever #20 SI = ~SI;

        end

        initial begin
            $monitor("At time %2t: SI = %d, LR = %d, clk = %d, SOL = %d, SOR = %d", $time, SI, LR, clk, SOL, SOR);
        end

        always #10 clk = ~clk;

endmodule

module ShiftLR (clk, SI, LR, SOL, SOR);

input clk, SI, LR;
output SOL, SOR;
reg [7:0] tmp;

    always @(posedge clk)
    begin
        // Left
        if (!LR) begin
            tmp = tmp << 1;
            tmp[0] = SI;
        end
        // Right
        else begin
            tmp = tmp >> 1;
            tmp[7] = SI;
        end
    end

    assign SOL  = tmp[7];
    assign SOR  = tmp[0];
    
endmodule