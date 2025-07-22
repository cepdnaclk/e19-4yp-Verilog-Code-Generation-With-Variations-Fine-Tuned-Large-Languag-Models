```
module ALU(output reg[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
    reg signed[3:0] a, b;

    initial begin
        $monitor("A=%b, B=%b, Output=%b", ArgA, ArgB, Result);
    end

    always @* begin
        a = ArgA;
        b = ArgB;
        Result = a + b;
    end

    specify
        specparam tRise = 5, tFall = 4;
        (Clk *> Result) = (tRise, tFall);
    endspecify
endmodule
```
### Scope:
Module, Instance, Design, Verilog
### Variations:
*	Convert inputs a and b to logic signed [3:0] to test signed arithmetic operations.
*	Drain all timing paths of all logic gates.
*	Change the clock period:
    *	`specparam tRise = 5, tFall = 4;` to `specparam tRise = 7, tFall = 6;`
    *	`specparam tFall = 4, tRise = 5;` to `specparam tFall = 6, tRise = 7;`
### Results:
*	Convert inputs a and b to logic signed [3:0] to test signed arithmetic operations.
    *	VCS reports timing errors on all logic gates.
    *	VCS reports no timing errors on all logic gates. This indicates that the path is fully drained.
*	Drain all timing paths of all logic gates.
    *	VCS reports timing errors on all logic gates.
*	Change the clock period:
    *	`specparam tRise = 5, tFall = 4;` to `specparam tRise = 7, tFall = 6;`
        *	VCS reports timing errors on all logic gates.
    *	`specparam tFall = 4, tRise = 5;` to `specparam tFall = 6, tRise = 7;`
        *	VCS reports timing errors on all logic gates.
### Remarks:
This test