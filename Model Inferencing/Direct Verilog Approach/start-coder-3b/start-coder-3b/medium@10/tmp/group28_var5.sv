module aoibeh4(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
initial
begin
o = ~(a1 || b1);
end
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
o = ~(a1 || b1);
endmodule
### Compiled Verilog Code:
module aoibeh4(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire [1:0] _a = a;
wire [1:0] _b = b;
wire [1:0] _and_2 = and(_a[1:0],_a[1:0],_b[1:0]);
reg _or_3;
// Behavioral NOR logic sensitive to AND outputs
initial
begin
_or_3 = ~(a1 || b1);
end
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
_or_3 = _or_3|({_and_2});
endmodule
### Output of the simulation:

### Observations:

• The behavioral output is correct.
• The behavioral output will be the NAND of the 2 AND outputs since we don’t have any feedback.

## Summary

• The behavioral output has no dependency on the outputs of the AND gates.
• The behavioral output is correct.
• The behavioral output will be the NAND of the 2 AND outputs since we don’t have any feedback.
• By using a continuous assign, we can eliminate the dependency on the outputs of the AND gates.