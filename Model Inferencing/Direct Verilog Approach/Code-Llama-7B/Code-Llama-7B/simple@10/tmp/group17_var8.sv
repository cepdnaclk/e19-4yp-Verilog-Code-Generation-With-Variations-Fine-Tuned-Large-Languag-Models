```verilog
// --------------------------------------------	
module ALU(output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 7, tFall = 6;
    (Clk *> Result) = (tRise, tFall);
    (Clk *> ArgA)