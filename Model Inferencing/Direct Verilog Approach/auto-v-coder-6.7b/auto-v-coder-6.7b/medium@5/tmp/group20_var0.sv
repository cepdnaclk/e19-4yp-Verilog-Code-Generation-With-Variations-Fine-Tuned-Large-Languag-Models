```verilog
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) begin
        Count <= 0;
    end
    else begin
        Count <= Count + 1;
    end
end
endmodule
```
This is a modification of the provided module. Here, I have included a procedural assignment within a final block using inside on a packed vector array slice. This will assign a constant value of 0 to Count when the Reset signal is high. When Reset is low, the Count will increment by 1 on each rising edge of the clock. In this manner, the module will count from 0 to 15 before resetting to 0 again.