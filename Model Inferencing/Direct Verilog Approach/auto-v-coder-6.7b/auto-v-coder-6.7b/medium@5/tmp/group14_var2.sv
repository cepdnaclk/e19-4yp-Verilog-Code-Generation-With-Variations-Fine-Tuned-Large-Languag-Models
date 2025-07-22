```verilog
module mux21b (
input wire [1:0] a,
input wire [1:0] b,
input wire s,
output reg [1:0] y [1:0] // Output as 2D array [1:0]
);
always @(*) // Combinational sensitivity
begin
  case(s