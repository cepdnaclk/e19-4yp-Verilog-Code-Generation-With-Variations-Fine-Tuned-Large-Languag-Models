module ALU (output[31:0] Result,
    input[3:0] ArgA, ArgB,
    input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
    (ArgA, ArgB) = (3, 4);
    (ArgA, ArgB