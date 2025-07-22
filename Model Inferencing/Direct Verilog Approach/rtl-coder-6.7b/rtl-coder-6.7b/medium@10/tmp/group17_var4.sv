module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = (~s[1] & ~s[0]? c[0] :
~s[1] & s[0]? c[1] :
s[1] & ~s[0]? c[2] :
s[1] & s[0]? c[3] : z);
endmodule
### Variation Instruction: