module example5(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire