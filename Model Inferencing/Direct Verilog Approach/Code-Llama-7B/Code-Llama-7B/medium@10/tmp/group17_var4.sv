module mux41b_1 (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
reg [3:0] a;
always @(s or c) a[s] = c; // Assign c[0], c[1], c[2] or c[3] to a[0], a[1], a[2] or a[3] respectively according to s value
assign z = a