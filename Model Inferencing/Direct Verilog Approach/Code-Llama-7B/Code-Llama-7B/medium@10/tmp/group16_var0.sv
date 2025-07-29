module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s)
y = a;
else
y = b;
endmodule

### Variation Subject:
Simplify the condition expression.
### Variation Instruction:
Simplify the condition expression to