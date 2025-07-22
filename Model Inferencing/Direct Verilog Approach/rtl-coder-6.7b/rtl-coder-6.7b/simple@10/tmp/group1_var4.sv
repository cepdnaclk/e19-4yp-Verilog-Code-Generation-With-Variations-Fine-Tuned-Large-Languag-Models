module XOR_Gate(
    input logic [1:0] A [0:3],
    output logic Y
);
    assign Y = A[0][0] ^ A[0][1] ^ A[1][0] ^ A[1][1] ^ A[2][0] ^ A[2][1] ^ A[3][0] ^ A[3][1];
endmodule
### Variation Description:
The array A is defined as a packed 1D logic-vector array with range [0:3] and width 2. The operator ^ (XOR) is used to perform a bitwise XOR operation on all elements in the array. The output Y is assigned the result of the XOR operation.