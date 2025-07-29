```verilog
// synthesis translate_off
module mux (
  output reg [3:0] Q,
  input [3:0] D,
  input [1:0] S
);
  always @ (*) begin
    if (S == 0) begin