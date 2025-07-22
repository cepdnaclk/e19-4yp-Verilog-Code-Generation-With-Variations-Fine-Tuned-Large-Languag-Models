module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end
endmodule

### RTL Verilog Code:
assign Count[0] = Clk;
assign Count[1] = Reset;
assign Count[2] = Count[3];