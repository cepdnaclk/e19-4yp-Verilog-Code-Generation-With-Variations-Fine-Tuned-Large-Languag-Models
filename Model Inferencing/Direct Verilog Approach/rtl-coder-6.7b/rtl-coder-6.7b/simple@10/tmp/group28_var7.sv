module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output wire [3:0] Sum;
output [3:0] RegSum;
wire [3:0] Sum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule