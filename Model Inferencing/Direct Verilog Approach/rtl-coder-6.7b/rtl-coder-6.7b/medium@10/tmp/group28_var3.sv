module aoibeh2V(o,a,b); // Mixed structural/behavioral AOI
output o;
input [1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
initial begin // Procedural continuous assign
assign {o} = {~(a1 || b1)};
end
endmodule
### Synthesis: 
Note that synthesis errors occur when trying to compile this module with either of the two code samples.