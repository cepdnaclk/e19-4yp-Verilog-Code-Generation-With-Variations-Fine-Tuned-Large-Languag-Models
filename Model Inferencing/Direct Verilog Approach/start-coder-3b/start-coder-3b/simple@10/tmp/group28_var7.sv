module example4(Input, Clock, Reset, Sum);
input Clock, Reset;
input [2:0] Input;
output wire [6:0] Sum;
wire [6:0] Sum;
reg4 R1 (Sum, Clock, Reset, Input);
endmodule

## Example 5
### Base Ver