`initial begin
for(i=0;i<8;i++) $display("%3d", {a[i]}%8); end
endmodule
### Expected Output:
01011111
### Instruction:
Run the above code using ModelSim simulator.
### Expected Output:
00000000
00010111
00111111
00000000
00001111
00111111
00000000
00001111