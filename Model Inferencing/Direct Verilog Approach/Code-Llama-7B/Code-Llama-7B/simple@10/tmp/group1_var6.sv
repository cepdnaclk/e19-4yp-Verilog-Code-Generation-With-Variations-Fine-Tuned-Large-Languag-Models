// Verilog code for Problem 4
module XOR_Gate(
    input [1:0] A [0:1][0:1],
    output Y
);
    integer i, j;
    wire w;
    generate
        for (i = 0; i < 2; i = i + 1) begin: n_for
            for (j = 0; j < 2; j = j + 1) begin: n_for
                assign w[1 - i - j] = A[i][j];
            end: n_for
        end: n_for
    endgenerate
    assign Y = w;
endmodule
### Variation Instruction:
Mod