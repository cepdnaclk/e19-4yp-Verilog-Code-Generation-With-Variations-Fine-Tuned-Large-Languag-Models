```verilog
module tst_pseudo_random(clk, rst, en, pr);
input clk, rst, en;
output reg [3:0] pr;
reg [3:0] r;
always @(posedge clk, posedge rst) begin
if (rst) begin
r <= 0;
pr <= 0;
end
else if (en) begin
pr <= r % 10;
r <= r + 1;
end
end
endmodule
```

## Problem 8
### Original Code:
module tst_ring_counter(clk, rst, ena, count);
input clk, rst, ena;
output reg [2:0] count;
always @(posedge clk, posedge rst) begin
if (rst) begin
count <= 3'b001;
end
else if (ena) begin
count <= count << 1;
if (count[2])