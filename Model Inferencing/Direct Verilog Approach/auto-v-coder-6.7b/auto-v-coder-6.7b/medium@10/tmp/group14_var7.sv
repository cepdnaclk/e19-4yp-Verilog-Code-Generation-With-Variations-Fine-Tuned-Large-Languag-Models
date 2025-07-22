```verilog
module mux21b (
input wire a,
input wire b,
input wire [1:0] s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case(s)
  2'b00: y = a;
  2'b01: y = b;
  default: y = 1'bz;  // Default to high-impedance (X) if inputs are invalid.
endcase
endmodule
```

Here, we have an array [1:0] s which holds two bits. This means all possible combinations (00, 01 and 10) can be used to choose between the two inputs a and b. The case statement is used to assign y to either a or b based on the 2 bit value of s. The `default` case is used to set the output to high-impedance (X) if any other value than 00 or 01 is used for s.

Note: The `default` case is not technically necessary in this Verilog code as it's covered by all valid inputs. However, it's good practice to include it for any code intended for synthesis, as it protects against bugs that might cause an output to not be driven if a new input combination is added.

Remember to select a synthesis tool that supports Verilog 2001 or later, as Verilog 2005 and later syntax is required for this kind of case structure.

Also, it's worth mentioning that in a real hardware design, you would typically have a tri-state output to enable high-impedance (X) state in simulation for cases where only a single output pin is being driven.

### Verilog Code Simulation:

```verilog
module tb_mux21b;

reg a, b, s;
wire y;

mux21b DUT(
.a(a),
.b(b),
.s(s),
.y(y)
);

initial begin
#0 a = 1; b = 0; s = 0;
#10 a = 0; b = 1; s = 1;
#20 $finish