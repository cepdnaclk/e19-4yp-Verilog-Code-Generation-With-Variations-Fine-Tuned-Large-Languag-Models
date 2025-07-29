module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset, Sum;
input [3:0] Data;
output [3:0] RegSum;
wire [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
endmodule
### Result of run:
No warning messages