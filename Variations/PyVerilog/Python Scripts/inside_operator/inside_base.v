module inside_base (
    input [7:0] A,
    output reg X
);
    reg [7:0] values [3:0];

    initial begin
        values[0] = 100;
        values[1] = 110;
        values[2] = 120;
        values[3] = 130;
    end

    always_comb begin
        X = A inside {values};
    end
endmodule