module Chap1Counter (Clk, Reset, Count, Dec);
input Clk, Reset, Dec;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    Count = Count + 1;
end
always @(negedge Clk) begin
    if(Dec && Count > 0) Count = Count - 1;
end
endmodule
### Explanation:
The Chap1Counter module is now modified to use the negedge construct to assert the Dec signal.

## Section 9: Chap1