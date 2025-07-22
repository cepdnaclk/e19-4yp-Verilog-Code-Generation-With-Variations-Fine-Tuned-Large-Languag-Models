module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;, wire [3:0] Sum, RegSum;
input [3:0] Data;
wire [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule