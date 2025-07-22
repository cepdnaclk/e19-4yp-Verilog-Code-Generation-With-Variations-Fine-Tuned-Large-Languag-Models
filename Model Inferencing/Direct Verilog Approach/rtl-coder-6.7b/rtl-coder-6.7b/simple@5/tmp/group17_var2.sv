module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
logic signed[3:0] ArgA_ls, ArgB_ls; // Logic signed values for arguments a and b
assign ArgA_ls = ArgA[3:0];
assign ArgB_ls = ArgB[3:0];
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
    (Clk *> ArgA_ls) = (tRise, tFall);
    (Clk *> ArgB_ls) = (tRise, tFall);
endspecify
endmodule
### Modelsim output of results of timing analysis:
### Timing analysis passes for the logic signed versions of the inputs, while fails for the logic unsigned versions.