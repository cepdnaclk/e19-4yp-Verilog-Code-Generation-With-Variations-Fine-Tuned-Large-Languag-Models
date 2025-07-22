module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
    logic signed [3:0] a;
    logic signed [3:0] b;
    logic signed [3:0] c;
    assign a = ArgA[3:0];
    assign b = ArgB[3:0];
    assign Result[3:0] = c[3:0];
    assign Result[31:4] = 0;
    always @(*)
    begin
        //addition
        c = a + b;
    end
    specify
        specparam tRise = 5, tFall = 4;
        (Clk *> Result) = (tRise, tFall);
    endspecify
endmodule
### Variation Instructions:
Add or remove 2's complement to a and b to test signed arithmetic operations.
Add or remove 2's complement to result to test signed arithmetic operations.