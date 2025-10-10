`timescale 1ns/1ns

// T Flip-Flop Module
module t_ff(q, t, clk, reset);
    input t, clk, reset;
    output reg q;

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 0;
        else if (t)
            q <= ~q;
        else
            q <= q;
    end
endmodule

// Sequential Circuit using two T Flip-Flops (Vector Form)
module seq_circuit(input x, clk, reset, output [1:0] state, output y);
    wire [1:0] t; // Excitation inputs for flip-flops

    // Assign A = state[1], B = state[0]
    // Example excitation equations (replace if given in your lab):
    assign t[1] = (~state[1] & x) | (state[0] & ~x);
    assign t[0] = (state[1] & ~state[0]) | (~state[1] & x);

    // Output equation (example)
    assign y = state[1] ^ state[0];

    // Instantiate T Flip-Flops
    t_ff T1(state[1], t[1], clk, reset);
    t_ff T2(state[0], t[0], clk, reset);
endmodule
