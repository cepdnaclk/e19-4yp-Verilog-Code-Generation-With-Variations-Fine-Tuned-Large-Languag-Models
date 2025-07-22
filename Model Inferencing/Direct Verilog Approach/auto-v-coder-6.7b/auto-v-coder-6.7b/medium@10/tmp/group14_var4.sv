```verilog
module mux41b #(
parameter WIDTH = 2 // default width is 2-bit
) (
input wire [WIDTH-1:0] a,
input wire [WIDTH-1:0] b,
input wire [WIDTH-1:0] c,
input wire [WIDTH-1:0] d,
input wire [1:0] s,
output reg [WIDTH-1:0] y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case (s) inside
  2'b00: y = a;
  2'b01: y = b;
  2'b10: y = c;
  2'b11: y = d;
endcase
endmodule
```
The above code creates a 4-to-1 multiplexer with `WIDTH` bit inputs and outputs. The input width can be specified at the module instantiation if you prefer different widths. Note that this code works with vectors/arrays of bits.

We have used 2D array for selecting inputs based on s. The syntax used here is verilog 2001 or later versions. We have used 2-D array as a packed array. 

This will select inputs based on the value of's' using case statement.