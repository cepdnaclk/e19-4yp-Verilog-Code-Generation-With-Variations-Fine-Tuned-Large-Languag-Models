module example6(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule
### Variation Expected Output:

module example6(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule
### Variation Tested Output:

module example6(Data, Clock, Reset, RegSum, Sum);
input Clock