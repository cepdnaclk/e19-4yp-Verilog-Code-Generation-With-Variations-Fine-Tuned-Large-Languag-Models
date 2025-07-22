module latch(Q,D,CLK);
input D,CLK;
output Q;
always @(posedge CLK) Q=D;
endmodule
### Base Verilog Code:
module dff(do,di,clk); // Behavioral D Flip-Flop
output do;