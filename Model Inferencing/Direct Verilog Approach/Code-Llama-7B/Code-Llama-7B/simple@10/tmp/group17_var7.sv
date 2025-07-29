module ALU_Tester();

logic Clk;
wire[31:0] Result;
wire[3:0] ArgA, ArgB;
wire[31:0] C;
ALU alu(.Result(Result),.ArgA(ArgA),.ArgB(ArgB