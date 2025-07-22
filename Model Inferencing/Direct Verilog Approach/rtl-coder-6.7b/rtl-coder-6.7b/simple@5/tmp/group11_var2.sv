module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
struct DataComp {
    bit [7:0] Data;
    rand bit Signals;
} data_inst;
endmodule