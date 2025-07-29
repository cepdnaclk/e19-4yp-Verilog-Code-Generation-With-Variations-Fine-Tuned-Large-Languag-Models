module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
rand struct {
	rand logic [7:0] rand_;
} Data;
endmodule
### Test Case:
input [7:0] DataIn = 8'b01010101;
output [7:0] DataOut;
input ControlSignals;
DataComponent Dut(.DataIn(DataIn),.DataOut(DataOut),.ControlSignals(ControlSignals));
endmodule
### Test Bench:
module DataComponentTest;
DUT: DataComponent (
	.DataIn(DataIn),
	.DataOut(DataOut),
	.ControlSignals(ControlSignals)
);
logic [7:0] DataIn;
logic [7:0] DataOut;
logic ControlSignals;
initial begin
	DataIn = 8'b00000000;
	ControlSignals = 0;
	repeat (4) @(posedge ControlSignals);
	assert (DataOut == DataIn);
	final
	$info("Passed!");
end