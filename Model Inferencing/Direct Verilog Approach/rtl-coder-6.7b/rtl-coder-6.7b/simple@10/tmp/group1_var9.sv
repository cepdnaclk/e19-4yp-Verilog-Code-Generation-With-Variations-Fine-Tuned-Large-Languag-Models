module XOR_Gate(
    input logic [1:0] A [0:3],
    output logic Y
);
    parameter NUM_BITS = 2;
    parameter NUM_ELEMENTS = 4;
    assign Y = A[NUM_ELEMENTS-1][NUM_BITS-1] ^ A[NUM_ELEMENTS-1][NUM_BITS-2];
endmodule