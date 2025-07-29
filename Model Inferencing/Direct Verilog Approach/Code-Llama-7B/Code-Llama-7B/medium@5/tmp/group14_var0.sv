module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case (s)
2: y = a; // Select a if s=0
default: y = b; // Select b if s=1
endcase
endmodule
### Discussion:
The code in this variation is unchanged. The only difference is that the array is now 1D instead of 2D.

### Variation Instruction:
Remove all