module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) begin
        Count = 0;
        Count[1] <= 1;
    end
    else Count = Count + 1;
end
endmodule
### Differences:
The testbench code will remain the same.
### Testbench Code:
`timescale 1ns/100ps
module Chap1CounterTestbench;
reg Clk;
reg Reset;
wire [3:0] Count;
Chap1Counter dut (Clk, Reset, Count);
initial begin
    Reset = 1;
    Clk = 0;
    #10 Reset = 0;
    #1000 $finish;
end
always #5 Clk = ~Clk;
endmodule
### Code Output:
#####
Count = 0000
Count = 0001
Count = 0010
Count = 0011
Count = 0100
Count = 0101
Count = 0110
Count = 0111
Count = 1000
Count = 1001
Count = 1010
Count = 1011
Count = 1100
Count = 1101
Count = 1110
Count = 1111
Count = 0000
###