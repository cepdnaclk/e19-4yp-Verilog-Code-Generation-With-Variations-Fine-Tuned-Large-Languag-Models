module test_k(clk, preset, clear, q, j, k);
jkEdgeFF jk(q, clk, j, k, preset, clear);
parameter N = 16;
assign valid[0] = q[0];
jkMulti jk(valid, clk, j, k, preset, clear);
jkMulti jk1(valid, clk, 0, 0, preset, clear);
jkMulti jk2(valid, clk, 1, 0, preset, clear);
jkMulti jk3(valid, clk, 2, 0, preset, clear);
jkMulti jk4(valid, clk, 3, 0, preset, clear);
jkMulti jk5(valid, clk, 4, 0, preset, clear);
jkMulti jk6(valid, clk, 5, 0, preset, clear);
jkMulti jk7(valid, clk, 6, 0, preset, clear);
jkMulti jk8(valid, clk, 7, 0, preset, clear);
jkMulti jk9(valid, clk, 8, 0, preset, clear);
jkMulti jk10(valid, clk, 9, 0, preset, clear);
jkMulti jk11(valid, clk, 10, 0, preset, clear);
jkMulti jk12(valid, clk, 11, 0, preset, clear);
jkMulti jk13(valid, clk, 12, 0, preset, clear);
jkMulti jk14(valid, clk, 13, 0, preset, clear);
jkMulti jk15(valid, clk, 14, 0, preset, clear);
jkMulti jk16(valid, clk, 15, 0, preset, clear);
always @(posedge clk)
begin
if (preset)
j <= j + 1;
else if (clear)
k <= k + 1;
else
begin
j <= j;
k <= k;
end
end
endmodule
### Testing
1. Create a testbench for your module.
2. Generate a waveform of your module.
3. Examine the waveform to verify that the MDA works.

## Testing Multi-Dimensional Arrays

### Base Verilog Code:
module test_k(clk, preset, clear, q, j, k);
jkEdgeFF jk(q, clk, j, k, preset, clear);
parameter N = 16;
assign valid[0] = q;
jkMulti jk(valid, clk, j, k, preset, clear);
jkMulti jk1(valid, clk, 0