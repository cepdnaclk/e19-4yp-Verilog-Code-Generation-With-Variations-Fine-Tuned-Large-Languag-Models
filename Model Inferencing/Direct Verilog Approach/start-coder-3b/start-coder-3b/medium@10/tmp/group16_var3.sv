module mux8(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);

always @(*)