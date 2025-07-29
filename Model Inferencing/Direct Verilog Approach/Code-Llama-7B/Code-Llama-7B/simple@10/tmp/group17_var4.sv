module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
    assign ArgA = $signed(ArgA);
    assign ArgB = $signed(ArgB);
endspecify
endmodule
### Expected Result:
* Result = $signed(ArgA) + $signed(ArgB)
### Pass Criteria:
* Output should be correct for all test cases.

### Testcase:
1. Addition of two positive signed numbers.
```verilog
module tb;
  logic Clk = 0;
  always #5 Clk = ~Clk;
  logic [31:0] Result;
  logic [31:0] ArgA = 42;
  logic [31:0] ArgB = 8;
  ALU uut (.*);
endmodule
```
### Expected Result:
* Result = 50
### Pass Criteria:
* Output should be correct for all test cases.
### Testcase:
2. Addition of two negative signed numbers.
```verilog
module tb;
  logic Clk = 0;
  always #5 Clk = ~Clk;
  logic [31:0] Result;
  logic [31:0] ArgA = -42;
  logic [31:0] ArgB = -8;
  ALU uut (.*);
endmodule
```
### Expected Result:
* Result = -50
### Pass Criteria:
* Output should be correct for all test cases.

### Testcase:
3. Subtraction of two positive signed numbers.
```verilog
module tb;
  logic Clk = 0;
  always #5 Clk = ~Clk;
  logic [31:0] Result;
  logic [31:0] ArgA = 42;
  logic [31:0] ArgB = 8;
  ALU uut (