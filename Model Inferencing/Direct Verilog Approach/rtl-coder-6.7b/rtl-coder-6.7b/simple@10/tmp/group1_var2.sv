// Verilog code for Problem 4
module XOR_Gate(
    input logic [1:0] A [0:3],
    output logic Y
);
    assign Y = (A[0][0] ^ A[0][1]) ^ (A[1][0] ^ A[1][1]) ^ (A[2][0] ^ A[2][1]) ^ (A[3][0] ^ A[3][1]);
endmodule
### Testbench:
// Verilog testbench for Problem 4
module XOR_Gate_testbench;
    logic [1:0] A [0:3];
    logic Y;

    XOR_Gate DUT(
       .A(A),
       .Y(Y)
    );

    // Testbench code
    initial begin
        A[0] = 2'b00; A[1] = 2'b11; A[2] = 2'b01; A[3] = 2'b10;
        #10;
        A[0] = 2'b10; A[1] = 2'b01; A[2] = 2'b11; A[3] = 2'b00;
        #10;
        A[0] = 2'b11; A[1] = 2'b10; A[2] = 2'b11; A[3] = 2'b10;
        #10;
        $finish;
    end
endmodule
### Results:
// Output log
```
XOR: Y = 1
XOR: Y = 1
XOR: Y = 0
```
### Verilog Code:
// Verilog code for Problem 4
module XOR_Gate(
    input logic [1:0] A [0:3],
    output logic Y
);
    assign Y = (A[0][0] ^ A[0][1]) ^ (A[1][0] ^ A[1][1]) ^ (A[2][0] ^ A[2][1]) ^ (A[3][0] ^ A[3][1]);
endmodule
### Testbench:
//