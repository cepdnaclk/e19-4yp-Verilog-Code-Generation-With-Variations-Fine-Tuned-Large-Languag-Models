module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count <= Count + 1;
end
always @(posedge Clk) begin
    Count <= Count + 1;
end
always @(negedge Clk) begin
    Count <= Count + 1;
end
endmodule
### Comment:
This allows the counter to increment on every clock cycle, and increment when the clock rising edge is active.
### Result:
I ran the simulation several times and all of them gave the same result:
Reset the counter to 0 upon reset.
Reset = 1
Count = 1
Reset = 0
Count = 2
Reset = 1
Count = 3
Reset = 0
Count = 4
Reset = 1
Count = 5
Reset = 0
Count = 6
Reset = 1
Count = 7
Reset = 0
Count = 8
Reset = 1
Count = 9
Reset = 0
Count = 10
Reset = 1
Count = 11
Reset = 0
Count = 12
Reset = 1
Count = 13
Reset = 0
Count = 14
Reset = 1
Count = 15
Reset = 0
Count = 16
Reset = 1
Count = 17
Reset = 0
Count = 18
Reset = 1
Count = 19
Reset = 0
Count = 20
Reset = 1
Count = 21
Reset = 0
Count = 22
Reset = 1
Count = 23
Reset = 0
Count = 24
Reset = 1
Count = 25
Reset = 0