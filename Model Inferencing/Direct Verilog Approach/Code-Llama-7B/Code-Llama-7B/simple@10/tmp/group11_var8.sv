module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
wire[7:0] DataOut_inner;
struct T {
  rand reg w; 
} dataOut_inner;
DataOut = dataOut_inner.w;
endmodule
### Expected Return Value:
Simulation Pass
### Created Tilecode:
module DataComponent (DataIn, DataOut, ControlSignals);
input wire [7:0] DataIn;
output wire [7:0] DataOut;
input wire ControlSignals;
wire[7:0] DataOut_inner;
struct T {
  rand reg w; 
} dataOut_inner;
DataOut_inner.w = DataIn;
assign DataOut = DataOut_inner.w;
endmodule




### Base