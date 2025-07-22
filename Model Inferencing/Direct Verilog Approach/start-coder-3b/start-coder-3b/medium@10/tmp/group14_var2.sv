module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
); // Packed 2D array

wire [1:0] sel = {b:a}; // Packed 2D array

always @(*) // Combinational sensitivity
y = sel[s]; // Select a if s=0 else b if s=1
endmodule

### Procedural Code:
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
); // Packed 2D array

wire [1:0] sel = {b:a}; // Packed 2D array

always @(*) // Combinational sensitivity
case (s) // Priority case structure
0: y = a;
1: y = b;
endcase

endmodule

### End Statement:
endmodule
```