module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case (s)
0: y = a; // Select a if s=0
1: y = b; // Select b if s=1
default: y = b; // Select b if s=1
endcase
endmodule

[1],,,, and. “Restructuring Large-Scale Chip Architectures.” In Proceedings of the 44th Annual Design Automation Conference, 65–74. New York, NY, USA: San Diego, CA, USA: ACM, 2007.