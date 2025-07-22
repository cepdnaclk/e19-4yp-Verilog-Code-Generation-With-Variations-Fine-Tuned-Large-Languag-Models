module counter #(N=10) (input clk, reset, output reg [N-1:0] q);
always @(posedge clk, posedge reset)
if (reset) q <= 0;