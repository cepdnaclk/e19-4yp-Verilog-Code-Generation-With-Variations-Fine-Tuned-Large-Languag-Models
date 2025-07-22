module fibonacci_generator (clk, rst, F0, F1, F2);
parameter WC = 8;
input clk;
input rst;
output wire [WC-1:0] F0;
output wire [WC-1:0] F1;
output reg [WC-1:0] F2;
wire [WC-1:0] F0_temp;
wire [WC-1:0] F1_temp;
always @(posedge clk) begin
if (rst) begin
F0_temp <= 0;
F1_temp <= 1;
F2 <= 0;
end
else
begin
F2 <= F0_temp + F1_temp;
F0_temp <= F1_temp;
F1_temp <= F2;
end
end
assign F0 = F0_temp;
assign F1 = F1_temp;
endmodule

module t_fibonacci_generator ();
parameter WC = 8;
reg clk;
reg rst;
wire [WC-1:0] F0;
wire [WC-1:0] F1;
wire [WC-1:0] F2;
fibonacci_generator M0 (clk, rst, F0, F1, F2);
initial
$monitor($time,,"F0 = %d, F1 = %d, F2 = %d", F0, F1, F2);
initial
begin
rst = 1;
clk = 0;
#5 rst = 0;
#5 rst = 0;
#5 rst = 0;
#5 rst = 0;
#5 rst = 0;
#5 rst = 0;
#5 rst = 0;
#5 rst = 0;
#5 rst = 0;
end
endmodule
### Variation Results:
Simulation Output:
```
45,,"F0 = 0, F1 = 1, F2 = 1
85,,"F0 = 1, F1 = 1, F2 = 2
125,,"F0 = 1, F1 = 2, F2 = 3
165,,"F0 = 2, F1 = 3, F2 = 5
205,,"F0 = 3, F1 = 5, F2 = 8
245,,"F0 = 5, F1 = 8, F2 = 13
285,,"F0 = 8, F1 = 13, F2 = 21
325,,"F0 = 13, F1 = 21, F2 = 34
365,,"F0 = 21, F1 = 34, F2 = 55
405,,"F0 = 34, F1 = 55, F2 = 89
```
Synthesized Circuit:
![fibonacci_generator](images/2022-08-11-15-51-29-image.png)

## 3. Signed magnitude comparator
### Base Verilog Code:
module comparator_mag (a, b, GT, equal, LT);
input [3:0] a;
input [3:0] b;
output GT;
output equal;
output LT;
wire GT_temp;
wire equal_temp;
wire LT_temp;
assign GT_temp = (a[3]==1 && b[3]==0)? 1 : (a[3]==1 && b[3]==1 && a>b)? 1 : 0;
assign equal_temp = (a[3]==0 && b[3]==0 && a==b)? 1 : (a[3]==1 && b[3]==1 && a==b)? 1 : 0;
assign LT_temp = (a[3]