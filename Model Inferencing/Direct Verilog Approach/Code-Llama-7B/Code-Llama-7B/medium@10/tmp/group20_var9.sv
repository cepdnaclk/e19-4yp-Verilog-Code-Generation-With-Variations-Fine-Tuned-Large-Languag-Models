module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end
final begin
    Count[2:0] = 3'b000; // <--
end
endmodule
### Modified TestBench Code:
module Chap1Counter_TB();
reg Clk;
reg Reset;
wire [3:0] Count;
Chap1Counter UUT(Clk, Reset, Count);
always begin
    Clk = 0;
    #10;
    Clk = 1;
    #10;
end
initial begin
    Reset = 1;