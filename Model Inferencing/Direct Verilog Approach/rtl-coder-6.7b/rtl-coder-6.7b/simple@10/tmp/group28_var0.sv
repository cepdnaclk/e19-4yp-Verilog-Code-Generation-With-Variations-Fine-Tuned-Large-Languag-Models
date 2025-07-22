module example3(Data, Clock, Reset, RegSum, RegSum2, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum, RegSum2;
wire [3:0] Sum, RegSum, RegSum2;
reg4 R1 (Sum, Clock, Reset, RegSum);
reg4 R2 (RegSum2, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule