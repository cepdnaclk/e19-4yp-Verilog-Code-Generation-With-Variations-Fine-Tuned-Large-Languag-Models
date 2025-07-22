module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
initial
begin
a1 = a[1:0];
b1 = b[1:0];
end
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
o = ~(a1 || b1);
endmodule

Updated on 21-Jan-2021 07:40:35