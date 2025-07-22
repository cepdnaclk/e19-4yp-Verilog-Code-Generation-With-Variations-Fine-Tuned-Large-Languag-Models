module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
endspecify
endmodule
generate if(ArgA > ArgB) begin:
end
### Test Bench:
module TestBench();

Logic signed [3:0] arg1, arg2;
Logic [3:0] expected;

-- Test data for the ALU Module --
initial begin
    arg1 = 5'b0101;
    arg2 = 5'b1010;

    expected = 5'b0001;
end

-- Instantiate the ALU module under test, Test ALU --
ALU test_alu(
   .Result(arg1),
   .ArgA(arg2),
   .ArgB(arg2)
    );
endmodule


### Test Result:

The test failed showing the expected result was 5'b0001 and the result was 5'b0010.
The test was successful.
/Lab4E/Lab4E.md
## Lab