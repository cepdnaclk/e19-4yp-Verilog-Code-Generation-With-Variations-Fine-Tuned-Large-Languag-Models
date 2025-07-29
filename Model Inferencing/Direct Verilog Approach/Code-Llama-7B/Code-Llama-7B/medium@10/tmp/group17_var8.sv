module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
case(s)
0: z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
1: z = ~s[1] & s[0] & c[1] // Select c[1] when s=01
2: z = s[1] & ~s[0] & c[2] // Select c[2] when s=10
3: z = s[1] & s[0] & c[3]; // Select c[3] when s=11
default: z = c[0];
endcase
endmodule
### Variation Instruction:
Add a case block with inside testing array elements selected by dynamic variable