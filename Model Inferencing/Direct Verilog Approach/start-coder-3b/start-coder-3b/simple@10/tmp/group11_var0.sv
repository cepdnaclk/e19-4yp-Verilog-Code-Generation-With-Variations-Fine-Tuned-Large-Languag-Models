module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

struct d_data {
rand unsigned [7:0] DataOut;
};

d_data d