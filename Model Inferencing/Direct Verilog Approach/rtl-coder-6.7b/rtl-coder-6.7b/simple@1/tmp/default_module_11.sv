module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
typedef struct {rand bit [7:0] DataIn; bit [7:0] DataOut; bit ControlSignals;} Data_t;
Data_t Data;

endmodule