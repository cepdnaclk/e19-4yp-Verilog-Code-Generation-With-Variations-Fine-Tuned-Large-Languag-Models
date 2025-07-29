module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) begin
        Count = 0;
        Count[2] < = 1;
    end
    else begin
        Count = Count + 1;
        Count[2] < = 1;