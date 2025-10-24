module async_up_counter (
    input clk,
    input clear,
    output [3:0] Q
);
    reg [3:0] Q_reg;
    assign Q = Q_reg;

    always @(posedge clk or negedge clear)
    begin
        if (!clear)
            Q_reg[0] <= 1'b0;
        else
            Q_reg[0] <= ~Q_reg[0];
    end

    always @(negedge Q_reg[0] or negedge clear)
    begin
        if (!clear)
            Q_reg[1] <= 1'b0;
        else
            Q_reg[1] <= ~Q_reg[1];
    end

    always @(negedge Q_reg[1] or negedge clear)
    begin
        if (!clear)
            Q_reg[2] <= 1'b0;
        else
            Q_reg[2] <= ~Q_reg[2];
    end

    always @(negedge Q_reg[2] or negedge clear)
    begin
        if (!clear)
            Q_reg[3] <= 1'b0;
        else
            Q_reg[3] <= ~Q_reg[3];
    end
endmodule

