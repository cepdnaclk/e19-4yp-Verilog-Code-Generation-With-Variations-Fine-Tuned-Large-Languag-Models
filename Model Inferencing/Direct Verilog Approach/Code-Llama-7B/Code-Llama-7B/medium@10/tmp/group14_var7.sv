module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case (s)
2'b00: y = a;
2'b01: y = b;
2'b10: y = {2{a}};