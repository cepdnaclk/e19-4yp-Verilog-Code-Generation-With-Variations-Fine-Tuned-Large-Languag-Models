module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specparam tRise = 100, tFall = 99;
specify
    (Clk *> Result) = (tRise, tFall);
endspecify
endmodule