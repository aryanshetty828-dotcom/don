`timescale 1ns/1ns
`include "ex2.v"
module async_up_counter_tb;

    reg clk, clear;
    wire [3:0] Q;

    async_up_counter uut (
        .clk(clk),
        .clear(clear),
        .Q(Q)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        clear = 0;

        #10 clear = 1;

        #200 $finish;
    end

    initial begin
        $dumpfile("async_up_counter.vcd");
        $dumpvars(0, async_up_counter_tb);
        $monitor("Time=%0t | Clear=%b | Q=%b", $time, clear, Q);
    end

endmodule

