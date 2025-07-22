module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
| ~s[1] & s[0] & c[1] // Select c[1] when s=01
| s[1] & ~s[0] & c[2] // Select c[2] when s=10
| s[1] & s[0] & c[3]; // Select c[3] when s=11
| c[4 + s[1] + 2*s[0] + 3*(1 + s[1])]; // Select c[4] when s=00
| c[5 + s[1] + 2*s[0] + 3*(1 + s[1])]; // Select c[5] when s=01
| c[6 + s[1] + 2*s[0] + 3*(1 + s[1])]; // Select c[6] when s=10
| c[7 + s[1] + 2*s[0] + 3*(1 + s[1])]; // Select c[7] when s=11
| s[2 + 1*s[1] + 2*s[0] + 3*s[1]]; // Select c[8] when s=01
| c[9 + 1*s[1] + 2*s[0] + 3*s[1]]; // Select c[9] when s=01
| c[10 + 1*s[1] + 2*s[0] + 3*s[1]]; // Select c[10] when s=11
| c[11 + 1*s[1] + 2*s[0] + 3*s[1]]; // Select c[11] when s=11
endmodule


# 6.4  Introduction to VHDL

## 6.4.1  Vhdl Basic Example

### base verilog code:
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[