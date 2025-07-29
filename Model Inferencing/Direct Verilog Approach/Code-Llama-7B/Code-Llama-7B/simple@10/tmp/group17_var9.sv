module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
    //logic [3:0] a, b;
    int a, b;
endspecify
endmodule
### DUT:
assign a = ArgA[3:0];
assign b = ArgB[3:0];
# Add
assign Result[3:0] = a[3:0] + b[3:0];
# Subtract
assign Result[3:0] = a[3:0] - b[3:0];

### Testbench:
# Add
tb_Result = tb_ArgA + tb_ArgB;
# Subtract
tb_Result = tb_ArgA - tb_ArgB;