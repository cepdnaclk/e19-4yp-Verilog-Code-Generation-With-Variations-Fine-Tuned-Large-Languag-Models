module Chap1Counter (Clk, Reset, Count, CarryOut);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    Count <= Count + 1;
end

always @(posedge Clk) begin
    if(Reset) Count = 0;
    CarryOut = (Count == 4'hF);
end
endmodule