module XOR_Gate_1D(
    input logic A [0:3], B 
);
    logic Y [0:3];
    assign Y = A ^ B;
    //assign Y = {A[0], A[1], A[2], A[3]} ^ B;
endmodule
### Expected Result:
A testbench is provided in test.sv using the modified code above. The expected result is