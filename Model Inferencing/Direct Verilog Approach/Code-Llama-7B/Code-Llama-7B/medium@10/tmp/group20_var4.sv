module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
final begin
    Count[1] = 1'b1; //This is the updated line
end
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end
endmodule
### Output Code:
![Counter Output](https://github.com/AkashSingh3031/The-Missing-Semester-of-Your-CS-Career/blob/master/