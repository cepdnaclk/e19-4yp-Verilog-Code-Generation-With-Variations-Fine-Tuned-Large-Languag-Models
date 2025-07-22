module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end
final begin
    inside(Count, 0) = Count;
end
endmodule
### Expected Output:
Count = 9
Count = 10
Count = 11
Count = 12
Count = 13
Count = 14
Count = 15
Count = 16
Count = 17
Count = 18
Count = 19
### Expected Synthesized RTL:
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end
assign inside(Count, 0) = Count;
endmodule
### Unique Verilog Code:
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end
endmodule