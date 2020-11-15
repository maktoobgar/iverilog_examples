module clock_generator (times, clk);

    input [63: 0] times;
    output reg clk = 0;
    integer i = 0;

    initial begin

        clk = 0;

        for(i = 0; i < times; i = i + 1)
        begin

            #10
            
            clk = ~clk;

        end

    end

endmodule
