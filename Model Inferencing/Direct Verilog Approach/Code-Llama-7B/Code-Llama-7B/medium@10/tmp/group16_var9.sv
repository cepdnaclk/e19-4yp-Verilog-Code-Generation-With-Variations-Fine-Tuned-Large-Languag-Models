module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
begin
if(s == 0)
y = a;
else if(s == 1)
y = b;
else if(s == 2)
y = 4'b0111;
else if(s == 3)
y = 4'b1001;
else if(s == 4)
y = 4'b