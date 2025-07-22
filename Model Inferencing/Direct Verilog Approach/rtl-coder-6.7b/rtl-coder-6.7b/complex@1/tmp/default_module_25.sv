``` verilog
module comparator (A, B, C, D, Y);
input A, B, C, D;
output Y;

wire [3:0] HiCount;
wire [3:0] AdjR;

assign AdjR[0] = A;
assign AdjR[1] = B;
assign AdjR[2] = B;
assign AdjR[3] = C;

assign HiCount[0] = AdjR[0];
assign HiCount[1] = AdjR[1] & HiCount[0];
assign HiCount[2] = AdjR[2] & HiCount[1];
assign HiCount[3] = AdjR[3] & HiCount[2];

assign Y = HiCount[3];
endmodule
```
### Screenshot:
![image](https://user-images.githubusercontent.com/122246221/231160152-265e56b4-fcc6-4646-8af6-418611a72d5f.png)