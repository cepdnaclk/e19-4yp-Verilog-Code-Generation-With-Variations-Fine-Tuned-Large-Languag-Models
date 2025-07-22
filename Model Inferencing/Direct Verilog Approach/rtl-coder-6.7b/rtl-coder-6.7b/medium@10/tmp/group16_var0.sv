module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s == 0)
y = a;
if(s == 1)
y = b;
if(s == 2)
y = 4’b0000;
if(s == 2)
y = 4’b0000;
if(s == 3)
y = a