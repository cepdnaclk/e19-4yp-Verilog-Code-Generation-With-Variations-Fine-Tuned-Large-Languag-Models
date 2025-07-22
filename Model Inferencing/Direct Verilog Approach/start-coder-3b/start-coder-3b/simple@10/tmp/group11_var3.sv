module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
struct data_struct {
logic [7:0] data;
logic rand;
};

struct data_struct data;
data.data = DataIn;
data.rand = rand;
endmodule