module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
wire [3:0] WireSum;
assign WireSum = Data + RegSum;
assign Sum = WireSum;
endmodule
### Expected Outputs:
- Sum is a wire array.