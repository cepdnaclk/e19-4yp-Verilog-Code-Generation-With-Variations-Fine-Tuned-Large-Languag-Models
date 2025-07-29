module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case (s)
0: y = case (a)
0: b; // Select b if s=0
1: a; // Select a if s=1
endcase;
1: y = b; // Select a if s=0
endcase
endmodule