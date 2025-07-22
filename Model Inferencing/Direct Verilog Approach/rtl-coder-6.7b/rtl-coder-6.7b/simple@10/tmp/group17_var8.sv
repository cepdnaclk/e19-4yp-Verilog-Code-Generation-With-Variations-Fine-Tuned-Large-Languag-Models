module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
logic [3:0] a, b;
assign a = ArgA[31:28];
assign b = ArgB[31:28];
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
    (a *> b) = (tRise, tFall);
endspecify
endmodule