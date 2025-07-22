module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
struct {bit[8] rand randc a; bit[8] rand b;} data_struct;
endmodule