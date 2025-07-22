module XOR_Gate(
    input logic [1:0] A [3],
    output logic [1:0] Y [3]
);
    genvar i;
    generate
        for (i = 0; i < 4; i++) begin : xor_gates
            assign Y[i] = A[i] ^ {1'b0, 1'b1};
        end
    endgenerate
endmodule
###