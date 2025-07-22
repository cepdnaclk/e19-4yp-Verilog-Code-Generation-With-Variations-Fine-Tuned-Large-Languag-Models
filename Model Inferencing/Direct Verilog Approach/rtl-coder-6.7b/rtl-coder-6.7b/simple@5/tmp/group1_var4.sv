// Verilog code for Problem 4
module XOR_Gate_MultiDim(
    input logic [1:0] A [0:3],
    output logic Y
);
    assign Y = A[0] ^ A[1] ^ A[2] ^ A[3];
endmodule