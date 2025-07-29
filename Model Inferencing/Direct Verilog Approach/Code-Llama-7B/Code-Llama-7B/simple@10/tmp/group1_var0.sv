// Verilog code for Problem 4
module XOR_Gate(
    input A [1:0], B [1:0],
    output Y
);
    assign Y = A[0] ^ B[0];
endmodule
### Test Bench Code:
// Test bench for Problem 4
module XOR_Gate_TB();
    logic [1:0] A, B, Y;

    XOR_Gate UUT(
       .A(A),
       .B(B),
       .Y(Y)
    );

    initial begin
        A = 2'b00;
        B = 2'b00;
        # 5ns;
        A = 2'b01;
        B = 2'b01;
        # 5ns;
        A = 2'b11;
        B = 2'b00;
        # 5ns;
        A = 2'b00;
        B = 2'b11;
    end
endmodule
### Simulation Result Verification:
// Simulation Result
// 
//    A = 00 B = 00 Y = 0
// 
//    A = 01 B = 01 Y = 0
// 
//    A = 11 B = 00 Y = 1
// 
//    A = 00 B = 11 Y = 1
### Discussion:
The above design is similar to the one implemented in Part 4 of the lab assignment. However, the inputs A and B have been changed to be elements of a 1D logic array with 2 bits. The input port is defined as A [1:0] and the output is defined as Y. The inside operator is used to test the multi-dimensional handling of the verilog syntax.

## Problem 5:
### Base Verilog Code:
// Verilog code for Problem 5
module XOR_Gate(
    input A [1:0], B [1:0],
    output Y
);
    assign Y = A[0] ^ B[0];
endmodule
### Variation Instruction: