module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;
reg4 R1 ([3:0] Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule
### Expected Data:
This test will not work because the Sum wire is not compatible with RegSum, which is defined as a reg4 array.
### Error Message:
Reg3[4]: Output Sum[4] (of Instance example3.R1) has a conflicting type Sum[4][4] and