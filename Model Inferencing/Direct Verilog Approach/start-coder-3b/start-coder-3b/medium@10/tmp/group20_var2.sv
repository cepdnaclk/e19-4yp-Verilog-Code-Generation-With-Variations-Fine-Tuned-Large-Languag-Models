module Chap1Counter (Clk, Reset, CountRegister, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count <= 0;
    else Count <= Count + 1;
end
initial begin