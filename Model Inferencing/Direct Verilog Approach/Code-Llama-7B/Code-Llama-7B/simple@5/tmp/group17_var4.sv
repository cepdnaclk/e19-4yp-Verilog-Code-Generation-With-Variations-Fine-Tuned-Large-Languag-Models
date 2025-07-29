module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
    (ArgA *> ArgA) = (tRise, tFall);
    (ArgB *> ArgB) = (tRise, tFall);
endspecify
endmodule
### Test Code:
module tb;
    reg [31:0] Result;
    reg [31:0] ArgA, ArgB;
    reg Clk;
    initial begin
        $dumpfile("ALU.vcd");
        $dumpvars(0, ALU);
        Clk = 0;
        $monitor("%d %d %d", Clk, Result, ArgA + ArgB);
    end
    initial begin
        #500 $finish;
    end
    ALU ALU_inst(Result, ArgA, ArgB, Clk);
    always #1 Clk = ~Clk;
    initial
        begin
            ArgA = 32'h01234567;
            ArgB = 32'h89abcdef;
            #10
            ArgA = 32'h80000000;
            ArgB = 32'h80000000;
            #10
            ArgA = 32'h80000000;
            ArgB = 32'h7fffffff;
            #10
            ArgA = 32'h7fffffff;
            ArgB = 32'h7fffffff;
        end
endmodule
### Result:
![signed test](https://github.com/ZxhQ/code-examples/blob/master/Verilog/Verilog%20Tutorial%202.%20Synthesis%20and%20FPGA%20Design%20(%E4%BA%8C)%20Signed%2