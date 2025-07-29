module ALU_Signed (output[31:0] Result, input[31:0] ArgA, ArgB, input clk);
specify
    specparam tRise = 5, tFall = 4;
    (clk *> Result) = (tRise, tFall);
    (Clk *> ArgA) = (tRise, tFall);
    (Clk *> ArgB) = (tRise, tFall);
endspecify
endmodule
### Scope:
- ALU_Signed: The resulting logic data (Result) is unsigned, and should be converted to signed data.
### Expected Result:
The ALU_Signed module should pass any test that was previously passing with the ALU module.
### Failures:
- The ALU_Signed module does not perform the arithmetic operations on the signed data.
### Modification:
The input and output value type signatures need to be modified to be signed as well as the test code to properly compare the output.
### Code:
```
module ALU_Signed (output logic signed [31:0] Result, input logic signed [31:0] ArgA, ArgB, input logic Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
    (Clk *> ArgA) = (tRise, tFall);
    (Clk *> ArgB) = (tRise, tFall);
endspecify
endmodule

module TB_ALU_Signed();
reg Clk;
reg signed [31:0] ArgA;
reg signed [31:0] ArgB;
wire logic signed [31:0] Result;
ALU_Signed alu_signed(Result, ArgA, ArgB, Clk);
initial begin
    Clk = 0;
    repeat(100) # 10;
    ArgA = 10;
    ArgB = 5;
    repeat(10) # 10;
    Clk = 1;
    repeat