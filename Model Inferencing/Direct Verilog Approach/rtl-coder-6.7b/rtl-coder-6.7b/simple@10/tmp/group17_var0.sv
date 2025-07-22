module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
logic signed [3:0] a = ArgA[3:0];
logic signed [3:0] b = ArgB[3:0];
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
endspecify
endmodule