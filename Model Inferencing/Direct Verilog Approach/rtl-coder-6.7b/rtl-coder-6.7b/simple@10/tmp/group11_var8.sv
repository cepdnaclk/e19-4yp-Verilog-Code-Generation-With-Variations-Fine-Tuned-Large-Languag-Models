module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

struct {
	rand  bit [7:0] dat;
} DataStruct;

endmodule