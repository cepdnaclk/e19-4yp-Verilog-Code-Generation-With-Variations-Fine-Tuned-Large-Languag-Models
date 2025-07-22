module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
     if(Reset) Count = 0;
     else Count = Count + 1;
end
assign Count[3:1] = {1'b1,Count[3:2]};
endmodule
### Variation Explanation:
The procedural assignment within a final block causes a synthesis error.