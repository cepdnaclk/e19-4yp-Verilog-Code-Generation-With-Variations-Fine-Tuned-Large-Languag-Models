```
module regff(D,clk, Q);
    input clk, D;
    output Q;
    reg Q;
    always @(D or clk)