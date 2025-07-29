module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s == 0)
y = a;
else if(s[1] == 1)
y = b;
else if(s[1] == 0 && s[0] == 1)
y = b[1];
else if(s[1] == 0 && s[0] == 0)
begin
y = b[2];
y = b[1];
end
else if(s[1] == 0 && s[0] == 0)
y