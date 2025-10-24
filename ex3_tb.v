`timescale 1ns/1ns
`include "ex3.v"
module sequence_generator_tb;
    reg clk, clear;
    wire [2:0] Q;

    sequence_generator DUT (clk, clear, Q);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        clear = 0;
        #10 clear = 1;
        #200 $finish;
    end

    initial begin
        $dumpfile("sequence_generator.vcd");
        $dumpvars(0, sequence_generator_tb);
        $monitor("Time=%0t | Q = %3b", $time, Q);
    end
endmodule

