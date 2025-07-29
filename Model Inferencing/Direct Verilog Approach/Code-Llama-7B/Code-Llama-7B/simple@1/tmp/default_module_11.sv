module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
rand struct { data [7:0] data; } Data;
endmodule
### Tested Module Info:
module test;
rand DataComponent comp;
initial begin
	$dumpfile("test.vcd");
	$dumpvars;
	for(int i = 0; i < 10; i++) begin
		comp.ControlSignals = 1;
		comp.Data.data = 1;
		comp.DataIn = 2;
		#10
		$display("Data : %d", comp.DataOut);
		$display("DataIn : %d", comp.DataIn);
		$display("ControlSignals : %d", comp.ControlSignals);
		comp.ControlSignals = 0;
		#1000
	end
end
endmodule
### Tested Module Output:
Data : 0
DataIn : 2
ControlSignals : 1
Data : 0
DataIn : 2
ControlSignals : 0
Data : 1
DataIn : 2
ControlSignals : 1
Data : 0
DataIn : 2
ControlSignals : 0
Data : 1
DataIn : 2
ControlSignals : 1
Data : 0
DataIn : 2
ControlSignals : 0
Data : 1
DataIn : 2
ControlSignals : 1
Data : 0
DataIn : 2
ControlSignals : 0
Data : 1
DataIn : 2
ControlSignals : 1
Data : 0
DataIn : 2
ControlSignals : 0
Data : 1
DataIn : 2
ControlSignals : 1
Data : 0
DataIn : 2
ControlSignals : 0
Data : 1
DataIn : 2
ControlSignals : 1
Data : 0
DataIn : 2
ControlSignals : 0
Data : 1
DataIn : 2
ControlSignals :