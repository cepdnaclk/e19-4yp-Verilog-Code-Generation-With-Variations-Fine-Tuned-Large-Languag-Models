module Prob_6_12 (Q, D, CLK, RST);
// sequential D-type register with synchronous reset
output Q;
input D, CLK, RST;
reg Q_reg;
always @ (posedge CLK) if (RST) Q_reg = 1'b0; else if (~RST) Q_reg = 1'