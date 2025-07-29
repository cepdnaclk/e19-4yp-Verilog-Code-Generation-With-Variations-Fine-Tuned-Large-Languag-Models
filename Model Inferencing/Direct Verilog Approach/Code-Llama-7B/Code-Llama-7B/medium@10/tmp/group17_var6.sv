module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = case (s)
2'b00: c[0]; // Select c[0] when s=00
2'b01: c[1]; // Select c[1] when s=01
2'b10: c[2]; // Select c[2] when s=10
2'b11: c[3]; // Select c[3] when s=11
endcase;
endmodule
### Design Recommendations
- It is important to note that case block will not work properly when assigning output variable and when not used in the context of a combinational circuit.
- It is very important to note that case blocks are not meant to replace if-else statements.
### Example Design
- It is common to see code like the following:
```verilog
assign z = s[0]? c[0] : (s[0]? c[1] : (s[1]? c[2] : c[3]));
```
- This code is correct, however, it is more readable when using a case block
```verilog
assign z = case (s)
2'b00: c[0]; // Select c[0] when s=00
2'b01: c[1]; // Select c[1] when s=01
2'b10: c[2]; // Select c[2] when s=10
2'b11: c[3]; // Select c[3] when s=11
endcase;
```
- Using case blocks with 2-bit vectors is very common. In fact, case blocks can also be used with 1-bit vectors.
- It is not uncommon to see a case block with 2-bit vectors nested inside another case block. This is fine for synthesis as long as it is not done with different widths.
```verilog
assign z = case (s)
2'b00: c[0]; // Select c[0] when s=00
2'b01: case (s)
2'b00: c[1]; // Select c[1] when s=00
2'b01: c[2]; // Select c[2] when s=01
2'b10: c[3]; // Select c[3] when s=10
endcase; // Select c[3] when s=11
endcase; // Select c[0] when s=00
```
- The following code will not work as it is expecting a value for `s` when not providing a value for `s`.
```verilog
assign z = case (s)
2'b00: c[0]; // Select c[0] when s=00
2'b01: case (s)
2'b00: c[1]; // Select c[1] when s=00
2'b01: c[2]; // Select c[2] when s=01
2'b10: c[3]; // Select c[3] when s=10
endcase; // Select c[3] when s=11
endcase; // Select c[0] when s=00
```
- This code will also not work. The error is that it is trying to evaluate `case (s)`, but since `s` has not been connected to anything, it will not work.
```verilog
assign z = case (s)
2'b00: c[0]; // Select c[0] when s=00
2'b01: case (s)
2'b00: c[1]; // Select c[1] when s=00
2'b01: c[2]; // Select c[2] when s=01
2'b10: c[3]; // Select c[3] when s=10
endcase; // Select c[3] when s=11
endcase; // Select c[0] when s=00
```
- If the case block is not used with a combinational circuit, it will not work properly.
```verilog
reg q[3:0];
assign q[0] = case (s)
2'b00: c[0]; // Select c[0] when s=00
2'b0