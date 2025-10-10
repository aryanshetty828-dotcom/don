`timescale 1ns/1ns
`include "ex2.v"

module seq_circuit_tb;
    reg x, clk, reset;
    wire A, B, y;

    seq_circuit DUT(x, clk, reset, A, B, y);

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Test sequence
    initial begin
        $dumpfile("seq_circuit_tb.vcd");
        $dumpvars(0, seq_circuit_tb);

        reset = 1; x = 0;
        #20 reset = 0;

        x = 0; #40;
        x = 1; #40;
        x = 0; #40;
        x = 1; #40;

        $display("Simulation complete");
        $finish;
    end
endmodule
