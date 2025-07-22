module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
endspecify
endmodule
### Test Instruction:
s<a,b> = 2'b00;  // unsigned
s<a,b> = 2'b01;  // signed
s<a,b> = 2'b10;  // unsigned
s<a,b> = 2'b11;  // signed
### Test Results:
| Test Case  | Pass/Fail | Result |
| --------   | --------  | ------ |
| s<a,b> = 2'b00 | Passed | s20 59 65 2 |
| s<a,b> = 2'b01 | Passed | s35 4 65 2 |
| s<a,b> = 2'b10 | Passed | s20 59 65 2 |
| s<a,b> = 2'b11 | Passed | s35 4 65 2 |
/Week-1/README.md
# Week One

## VCS Code Base

### Base Code:
module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
endspecify
endmodule

### Variation Instruction:
Add a test harness to your design where you will generate the test vector file, the test bench, and a test driver for the ALU module