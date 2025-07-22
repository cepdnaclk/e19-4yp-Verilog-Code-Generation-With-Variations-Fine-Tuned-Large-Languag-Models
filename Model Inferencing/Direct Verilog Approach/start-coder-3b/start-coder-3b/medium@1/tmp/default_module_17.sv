module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = s[1]?~c[0]:s[0]?~c[1]:s[1]?~c[2]:c[3];
endmodule
### Result:

## Example 9:
### Base Verilog Code:
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
| ~s[1] & s[0] & c[1] // Select c[1] when s=01
| s[1]