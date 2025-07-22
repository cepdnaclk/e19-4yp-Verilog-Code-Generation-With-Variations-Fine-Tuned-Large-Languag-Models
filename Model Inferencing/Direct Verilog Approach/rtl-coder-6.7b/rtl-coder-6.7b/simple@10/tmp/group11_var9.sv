module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
struct {rand logic [7:0] randMember; } structVar;
endmodule
### Variation Description:
Replace the data construct with a struct containing a rand member to test randomization inside a structure.