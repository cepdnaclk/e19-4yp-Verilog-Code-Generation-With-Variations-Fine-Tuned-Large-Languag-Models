module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;
wire [3:0] ld;
reg4 R1 (Sum, Clock, Reset, RegSum, ld);
assign Sum = Data + RegSum;
endmodule