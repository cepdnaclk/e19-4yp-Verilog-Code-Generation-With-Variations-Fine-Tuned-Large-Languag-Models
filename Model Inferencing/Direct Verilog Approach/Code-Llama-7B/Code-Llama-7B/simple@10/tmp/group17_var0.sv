module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
    (Clk *> ArgA)  = $unsigned(ArgA);
    (Clk *> ArgB)  = $unsigned(ArgB);
    (Clk *> OverFLow) = (ArgA + ArgB) > 2**32;
endmodule
### Description of Variation:
The $unsigned operator is used to convert the values of ArgA and ArgB to unsigned binary numbers. This will help in testing unsigned arithmetic operations.
### Example
```verilog
module CLU (output[