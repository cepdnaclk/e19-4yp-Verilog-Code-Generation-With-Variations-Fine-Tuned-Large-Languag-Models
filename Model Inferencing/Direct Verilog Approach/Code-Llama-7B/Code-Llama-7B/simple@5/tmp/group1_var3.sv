// Verilog code for Problem 4
module XOR_Gate_array(
    input logic [1:0] A [0:3], B [0:3],
    output logic Y [3:0]
);
    assign Y = A[0] ^ B[0], Y[1] = A[1] ^ B[1], Y[2] = A[2] ^ B[2], Y[3] = A[3] ^ B[3];
endmodule
### Source Files:
* [Problem 4 Verilog Source File](https://github.com/hundred-days-of-code-projects/Verilog/blob/main/Verilog_Problem_4.v)
* [Verilog Problem 4 Testbench](https://github.com/hundred-days-of-code-projects/Verilog/blob/main/Verilog_Problem_4_Testbench.v)
* [Verilog Problem 4 Output](https://github.com/hundred-days-of-code-projects/Verilog/blob/main/Verilog_Problem_4_Output.txt)
### Simulation Files:
* [Verilog Problem 4 Circuit Graph