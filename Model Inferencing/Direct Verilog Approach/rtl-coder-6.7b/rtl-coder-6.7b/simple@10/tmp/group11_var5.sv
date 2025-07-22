module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
structure struct_name_1;
  rand bit [1:0] rand_member_1;
endstructure
endmodule
### Test Bench:
module DataComponent #(parameter DATA_WIDTH = 8) (DataIn, DataOut, ControlSignals);
input [DATA_WIDTH-1:0] DataIn;
output [DATA_WIDTH-1:0] DataOut;
input ControlSignals;
endmodule