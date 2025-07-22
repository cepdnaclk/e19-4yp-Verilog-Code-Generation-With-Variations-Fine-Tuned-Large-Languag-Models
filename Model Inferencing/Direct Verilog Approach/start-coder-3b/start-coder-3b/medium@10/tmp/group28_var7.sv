module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
input rst;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
always @(a or b)
o = ~(a1 || b1);
endmodule

### Results:
1. Performance Improvement: The code achieved