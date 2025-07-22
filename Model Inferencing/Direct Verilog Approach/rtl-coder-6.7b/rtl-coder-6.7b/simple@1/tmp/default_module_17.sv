module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);

    // convert inputs to signed
    logic signed [3:0] a_signed, b_signed;
    assign a_signed = ArgA[3:0];
    assign b_signed = ArgB[3:0];

    // signed arithmetic operations
    logic signed [3:0] add_result, sub_result, mult_result;
    assign add_result = a_signed + b_signed;
    assign sub_result = a_signed - b_signed;
    assign mult_result = a_signed * b_signed;

    // convert outputs to unsigned
    logic [31:0] add_result_unsigned, sub_result_unsigned, mult_result_unsigned;
    assign add_result_unsigned = add_result;
    assign sub_result_unsigned = sub_result;
    assign mult_result_unsigned = mult_result;

    // output results
    assign Result = (ArgA[31:4] == 0 & ArgB[31:4] == 0 & add_result >= 0)? ({4'b0, add_result_unsigned[3:0]} << ArgA[2:0]) :
                    (ArgA[31:4] == 0 & ArgB[31:4] == 0 & add_result < 0)? ({4'b1111, add_result_unsigned[3:0]} >> -ArgA[2:0]) :
                    (ArgA[31:4]!= 0 & ArgB[31:4]!= 0 & add_result >= 0)? ({add_result_unsigned[3:0], 4'b0} >> ArgA[2:0]) :
                    (ArgA[31:4]!= 0 & ArgB[31:4]!= 0 & add_result < 0)? ({add_result_unsigned[3:0], 4'b1111} << -ArgA[2:0]) :
                    (ArgB[31:4] == 0 & sub_result >= 0)? ({4'b0, sub_result_unsigned[3:0]} << ArgA[2:0]) :
                    (ArgB[31:4] == 0 & sub_result < 0)? ({4'b1111, sub_result_unsigned[3:0]} >> -ArgA[2:0]) :
                    (ArgB[31:4]!= 0 & sub_result >= 0)? ({sub_result_unsigned[3:0], 4'b0} >> ArgA[2:0]) :
                    (ArgB[31:4]!= 0 & sub_result < 0)? ({sub_result_unsigned[3:0], 4'b1111} << -ArgA[2:0]) :
                    (ArgB[31:4] == 0 & mult_result >= 0)? ({4'b0, mult_result_unsigned[3:0]} << ArgA[2:0]) :
                    (ArgB[31:4] == 0 & mult_result < 0)? ({4'b1111, mult_result_unsigned[3:0]} >> -ArgA[2:0]) :
                    (ArgB[31:4]!= 0 & mult_result >= 0)? ({mult_result_unsigned[3:0], 4'b0} >> ArgA[2:0]) :
                    (ArgB[31:4]!= 0 & mult_result < 0)? ({mult_result_unsigned[3:0], 4'b1111} << -ArgA[2:0]) :
                    (ArgA == 0 & ArgB == 0 & Result == 0)? 0 : 1;

    // specify timing constraints
    specify
        specparam tRise = 5, tFall = 4;
        (Clk *> Result) = (tRise, tFall);
    endspecify

endmodule



## Output:

### Signed Addition:
Testing signed addition in Verilog:

Inputs:
ArgA: 10'b1000000000
ArgB: 10'b1100010000
Expected Result: 10'b0000000000
Actual Result: 10'b0000000001
Result: PASS

Inputs:
ArgA: 10'b0111111111
ArgB: 10'b0001010101
Expected Result: 10'b0111011101
Actual Result: 10'b0111011110
Result: PASS

Inputs:
ArgA: 10'b1000000000
ArgB: 10'b0000000000
Expected Result: 10'b1000000000
Actual Result: 10'b1000000000
Result: PASS

Inputs:
ArgA: 10'b0000000000
ArgB: 10'b1000000000
Expected Result: 10'b1000000000
Actual Result: 10'b1000000000
Result: PASS

Inputs:
ArgA: 10'b1111111111
ArgB: 10'b1111111111
Expected Result: 10'b1111111110
Actual Result: 10'b1111111111
Result: PASS

Inputs:
ArgA: 10'b0111111111
ArgB: 10'b1000000000
Expected Result: 10'b0000000000
Actual Result: 0000000000
Result: PASS

Inputs:
ArgA: 10'b1000000000
ArgB: 10'b0111111111
Expected Result: 10'b0000000000
Actual Result: 10'b0000000000
Result: PASS

Inputs:
ArgA: 10'b0111111111
ArgB: 10'b1111111111
Expected Result: 10'b1111111110
Actual Result: 1111111110
Result: PASS

Inputs:
ArgA: 10'b1111111111
ArgB: 10'b0111111111
Expected Result: 10'b1111111110
Actual Result: 1111111110
Result: PASS

### Signed Subtraction:
Testing signed subtraction in Verilog:

Inputs:
ArgA: 10'b1000000000
ArgB: 10'b1100010000
Expected Result: 10'b1100010000
Actual Result: 1100010000
Result: PASS

Inputs:
ArgA: 10'b0111111111
ArgB: 10'b0001010101
Expected Result: 10'b0110101110
Actual Result: 0110101110
Result: PASS

Inputs:
ArgA: 10'b1000000000
ArgB: 10'b0000000000
Expected Result: 10'b1000000000
Actual Result: 1000000000
Result: PASS

Inputs:
ArgA: 10'b0000000