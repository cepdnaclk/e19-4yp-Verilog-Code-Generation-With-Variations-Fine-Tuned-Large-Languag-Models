module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, {Wire0, Wire1, Wire2, Wire3});
assign {Wire0, Wire1, Wire2, Wire3} = Data + RegSum;
endmodule
### Output:
The following output is produced.

Error: reg4: Variable 'Sum' declared as 'output' is not properly connected to a load.


### Expected Output:
### Bug Workaround:
Change the output ld to a wire type array with unpacked dimension to test wire-array compatibility.