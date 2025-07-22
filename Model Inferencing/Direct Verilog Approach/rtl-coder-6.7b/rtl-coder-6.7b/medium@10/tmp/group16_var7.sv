module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
reg [3:0] temp [1:0];

always @(*)
begin
if (s == 0)
temp[0] = a;
else
temp[0] = b;

if (s == 0)
temp[1] = a;
else
temp[1] = b;

y = temp[s];
end
endmodule