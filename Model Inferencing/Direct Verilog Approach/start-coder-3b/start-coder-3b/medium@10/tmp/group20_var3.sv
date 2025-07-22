module Chap1Counter (Clk, Reset, Count, Load, LoadReset);
input Clk, Reset, Load, LoadReset;
output [3:0] Count;
reg [3:0] Count;
reg [3:0] CountOn;
always @(posedge Clk or posedge Reset)
    if(Reset) begin    
        CountOn = 0;
    end
    if(Load) begin    
        CountOn = CountOn + 1;
        Count = CountOn;
    end
    else if(LoadReset) begin    
        CountOn = CountOn + 1;
    end
endmodule
### Verilog Code to run:
module Chap1Counter;
input wire Clk;
input wire Reset;
input wire Load;
input wire LoadReset;
output reg [3: