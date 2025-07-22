module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case (s)
0