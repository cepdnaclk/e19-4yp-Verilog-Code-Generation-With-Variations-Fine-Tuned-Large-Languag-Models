// NOR Gate
module nor3(out,a,b,c);
output out;
input a,b,c;
wire a1,b1,c1;
reg out;
// Structural NOT gates using primitives
not g1(a1,a), g2(b1,b), g3(c1,c);
// Behavioral NOR logic sensitive to NOT outputs
always@(a1,b1,c1)
out = (a1 & b1 & c1);
endmodule

// NAND Gate
module nand3(out,a,b,c);
output out;
input a,b,c;
wire a1,b1,c1;
reg out;
// Structural NOT gates using primitives
not g1(a1,a), g2(b1,b), g3(c1,c);
// Behavioral NAND logic sensitive to NOT outputs
always@(a1,b1,c1)
out = (a1 | b1 | c1);
endmodule

// AOI Gate
module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
o = ~(a1 || b1);
endmodule

// OAI Gate
module oaibeh2(o,a,b); // Mixed structural/behavioral OAI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural NOR gates using primitives
nor g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR