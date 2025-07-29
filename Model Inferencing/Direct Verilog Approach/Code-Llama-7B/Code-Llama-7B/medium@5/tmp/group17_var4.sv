```Verilog
module mux41f (
input wire [1:0] c,
input wire [3:0] s,
output wire z
);
always_comb begin
  case (s)
    4'b0000 :  z <=  c[0];
    4'b0001 :  z <=  c[1];
    4'b0011 :  z <=  c[2];
    4'b0111 :  z <=