module mux21f (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
begin
case(s)
1'b0 : y = a; // Select a if s=0
1'b1 : y = b; //