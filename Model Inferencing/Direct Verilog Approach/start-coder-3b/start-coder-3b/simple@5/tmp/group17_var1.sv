module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
endspecify
endmodule
### Results:
Results:
- Signed addition: + OKAY.
- Signed subtraction: - OKAY.
- Signed multiplication: X ERR.
- Signed divisio: X ERR.
- Signed left shift: X ERR.
- Signed right shift: X ERR.
- Signed 32 to 64 bit signed: - OKAY.