```
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
rand DataStruct Data; 
endmodule
```
### Testbench:
#### Original Testbench:
```
module TestComponent();
reg DataIn;
wire DataOut;
reg ControlSignals;

DataComponent dut(
	.DataIn(DataIn),
	.DataOut(DataOut),
	.ControlSignals(ControlSignals)
);

initial begin
	DataIn = 0;
	ControlSignals = 0;
end

initial begin
	#1;
	DataIn = 1;
	ControlSignals = 1;
end

initial begin
	#5;
	DataIn = 1;
	ControlSignals = 0;
end

initial begin
	#10;
	DataIn = 0;
	ControlSignals = 0;
end

initial begin
	#15;
	$finish;
end

endmodule
```
#### Modified Testbench:
```
module TestComponent();
reg DataIn;
wire [7:0] DataOut;
reg ControlSignals;

DataComponent dut(
	.DataIn(DataIn),
	.DataOut(DataOut),
	.ControlSignals(ControlSignals)
);

initial begin
	DataIn = 0;
	ControlSignals = 0;
end

initial begin
	#1;
	DataIn = 1;
	ControlSignals = 1;
end

initial begin
	#5;
	DataIn = 1;
	ControlSignals = 0;
end

initial begin
	#10;
	DataIn = 0;
	ControlSignals = 0;
end

initial begin
	#15;
	$finish;
end

endmodule
```
### Mapping File
#### Base Mapping File:
```
%Library/Map/Instr_Rand_Map:
%Library/Instr:
	DataComponent:
		Data: