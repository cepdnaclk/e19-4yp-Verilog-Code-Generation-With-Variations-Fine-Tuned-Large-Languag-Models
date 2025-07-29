`include "../../src/structs.svh"
`include "../../src/defines.svh"

module XOR_Gate_4D(
    input A [1:0][1:0][1:0][1:0],
    output Y
);
    assign Y = A[0][1][2][3] ^ A[1][2][3][0];
endmodule
### Testbench:
module XOR_Gate_4D_Test();
    logic [1:0][1:0][1:0][1:0] A;
    logic Y;
    XOR_Gate_4D uut(.A(A),.Y(Y));
    logic [1:0] array [1:0][1:0][1:0][1:0];
    

    initial begin
        array[0][0][0][0] = 1'd0;
        array[0][0][0][1] = 1'd0;
        array[0][0][1][0] = 1'd0;
        array[0][0][1][1] = 1'd0;
        array[0][1][0][0] = 1'd0;
        array[0][1][0][1] = 1'd0;
        array[0][1][1][0] = 1'd0;
        array[0][1][1][1] = 1'd0;
        array[1][0][0][0] = 1'd1;
        array[1][0][0][1] = 1'd0;
        array[1][0][1][0] = 1'd0;
        array[1][0][1][1] = 1'd0;
        array[1][1][0][0] = 1'd0;
        array[1][1][0][1] = 1'd1;
        array[1][1][1][0] = 1'd0;
        array[1][1][1][1] = 1'd1;
        for (int i = 0; i <