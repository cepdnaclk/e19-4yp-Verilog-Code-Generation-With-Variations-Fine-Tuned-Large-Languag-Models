module ALU (output logic [3:0] Result, input logic [3:0] ArgA, ArgB, input logic Clk);
    always @(posedge Clk) Result = ArgA + ArgB;
endmodule
### Testcase:
// Input: A = 4'b0111, B = 4'b0111 Clk = 0;
// Output: Result = 4'b1110;
### Testcase:
// Input: A = 4'b0111, B = 4'b0111 Clk = 1;
// Output: Result = 4'b1110;
### Testcase:
// Input: A = 4'b0111, B = 4'b0111 Clk = 0;
// Output: Result = 4'b1110;
### Testcase:
// Input: A = 4'b0111, B = 4'b0111 Clk = 0;
// Output: Result = 4'b1110;
### Testcase:
// Input: A = 4'b0111, B = 4'b0111 Clk = 1111;
// Output: Result = 4'b1110;
### Testcase:
// Input: A = 4'b0111, B = 4'b0111 Clk = 0000;
// Output: Result = 4'b1110;
### Testcase:
// Input: A = 4'b0111, B = 4'b0111 Clk = 1100;
// Output: Result = 4'b1110;
### Testcase:
// Input: A = 4'b0111, B = 4'b0111 Clk = 1000;
// Output: Result = 4'b1110;
### Testcase:
// Input: A = 4'b0111, B = 4'b0111 Clk = 0100;
// Output: Result = 4'b1110;
### Testcase:
// Input: A = 4'b0111, B = 4