module multiplier_4_bit (a, b, product);
input [3: 0] a, b;
output [7: 0] product;
reg [7: 0] sum;
wire [3: 0] x;
assign x = a * b;
always @ (a, b, x) begin
sum