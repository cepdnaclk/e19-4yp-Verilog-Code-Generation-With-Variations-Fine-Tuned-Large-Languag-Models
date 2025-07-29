```verilog
module mux163b(input wire [15:0] i_data, // input data
input wire [2:0] sel, // input select signal
output wire[3:0] o_data  // output data
);
reg [3:0] o_data;
always @*
case (sel)
  0: o_data = {16{i_data[0]}};
  1: o_data = {16{