module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*)
if(s == 0)
y = a; // Select a if s=0
else if (s == 1)
y = b;// Select b if s=1
else
y = a;// select a as the default value
endmodule
`