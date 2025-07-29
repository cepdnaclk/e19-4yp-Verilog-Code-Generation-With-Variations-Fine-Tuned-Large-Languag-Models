module mux21b (
input wire a[2:0],
input wire b[2:0],
input wire s[3:0],
output reg y // Output must be reg for procedural assignment
);
always @*
begin:inside
case(s)
4'b0001: y = a; // Select a if s=0
4'b0010: y = b; // Select b if s=1
4'b0100: y