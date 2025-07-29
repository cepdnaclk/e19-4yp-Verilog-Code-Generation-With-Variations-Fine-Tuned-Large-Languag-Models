module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specparam tRise = 5, tFall = 4;
    logic signed [3:0] iA, iB;
    logic[31:0] sResult;
    (Clk *> iA) = (tRise, tFall);
    (Clk *> iB) = (tRise, tFall);
    (Clk*>sResult) = (tRise, tFall);
    iA = ArgA[3:0];
    iB = ArgB[3:0];
    if(sResult[2] == 1 || sResult[2] == 0) begin
        (Clk*>Result) = (tRise, tFall);
        Result = sResult[31:0];
    end
    else begin
        (Clk*>Result) = (tRise, tFall);
        Result = 32'hFFFFFFFF;
    end
endspecify
endmodule
### Testbench Code:
module Top;
logic a[31:0], b[31:0], c[31:0];
logic clk;
logic[31:0] r, r0;
logic signed [3:0] ia, ib;
logic [31:0] sResult;

specify
    specparam tRise = 5, tFall = 4;
    (Clk *> a) = (tRise, tFall);
    (Clk *> b) = (tRise, tFall);
    (Clk *> c) = (tRise, tFall);
    (Clk *> clk) = (tRise, tFall);
endspecify

ALU DUT(.Result(r),.ArgA(a),.ArgB(b),.Clk(clk));

initial begin
    clk = 0;
    a = 'h12345678;
    b = 'h9ABCDEF0;
    c =