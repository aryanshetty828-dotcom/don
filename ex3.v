module tff (output reg Q, input T, input clk, input clear);
    always @(posedge clk or negedge clear)
    begin
        if (!clear)
            Q <= 0;
        else if (T)
            Q <= ~Q;
        else
            Q <= Q;
    end
endmodule

module sequence_generator (input clk, input clear, output [2:0] Q);

    wire T0, T1, T2;

    wire Q0, Q1, Q2;

    assign T0 = (~Q2 & ~Q1 & ~Q0) | (Q2 & Q1 & Q0);
    assign T1 = Q0;
    assign T2 = Q1 & Q0;

    tff FF0 (Q0, T0, clk, clear);
    tff FF1 (Q1, T1, clk, clear);
    tff FF2 (Q2, T2, clk, clear);

    assign Q = {Q2, Q1, Q0};

endmodule



