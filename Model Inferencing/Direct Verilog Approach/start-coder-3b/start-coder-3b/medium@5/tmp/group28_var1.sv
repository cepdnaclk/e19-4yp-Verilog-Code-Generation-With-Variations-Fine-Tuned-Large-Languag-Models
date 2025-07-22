module oaibenh2(o,a,b); // Mixed structural/behavioral OAI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of OR gates
reg o; // Behavioral output must be reg
// Structural OR gates using primitives
or g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NAND logic sensitive to OR outputs
always@(a1 or b1)
begin
a1 <= a[1];
b1 <= b[1];
end
always@(a1) begin
o <= ~a1; end
always@(b1) begin
o <= ~b1; end
endmodule

## 12.1.4.9. AOI-OAI1: AOI1-OAI1

Author: 

### Base Verilog Code:
module aoiai1(o,a,b,c); // Mixed structural/behavioral AOI/OAI
output o;
input[1:0]a,b,c;
wire a1,b1,c1; // Outputs of AND/OR gates
reg o; // Behavioral output must be reg
// Structural AND/OR gates using primitives
and g1(a1,a[1],a[0]), or g2(b1,b[