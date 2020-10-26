module ShiftLR (clk, SI, LR, SOL, SOR);

input clk, SI, LR;
output SOL, SOR;
reg [7:0] tmp;

    always @(posedge clk)
    begin
        // Left
        if (LR = 0) begin
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