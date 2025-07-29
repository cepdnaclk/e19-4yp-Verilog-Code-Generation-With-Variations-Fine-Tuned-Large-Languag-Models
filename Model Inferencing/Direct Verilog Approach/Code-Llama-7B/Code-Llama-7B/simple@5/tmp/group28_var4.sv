module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;

wire [3:0] Sum2;
assign Sum2[3:0] = Data[3:0] + RegSum[3:0];
reg4 R1 (Sum2, Clock, Reset, RegSum);

endmodule
### Description:
The code above is identical to the original except for two things:
1. The output wires ld and RegSum have changed to wire arrays with unpacked dimensions.
2. The addition logic for the output Sum has been changed to work with the wire arrays.
### Reference:
Page 137 in