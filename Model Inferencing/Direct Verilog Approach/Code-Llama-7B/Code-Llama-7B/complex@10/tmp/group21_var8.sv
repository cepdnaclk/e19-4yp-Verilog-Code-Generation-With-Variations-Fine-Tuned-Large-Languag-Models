```
module Prob_6_7_Latch_Mealy #(parameter N = 3) (q, di, clk, rst);
// Mealy nonresetting sequence detector
parameter N_2 = $clog2(N);
output reg [N_2: 0] q;
input [N_2: 0] di;
input clk, rst;
wire [N_2: 0] din = {di[N-1], di[N-2: 0]};
```