// Verilog code for Problem 4
module XOR_Gate(
    input logic [1:0] A [0:3],
    output logic Y
);
    assign Y = (A[0][0] ^ A[0][1]) | (A[1][0] ^ A[1][1]) | (A[2][0] ^ A[2][1]) | (A[3][0] ^ A[3][1]);
endmodule