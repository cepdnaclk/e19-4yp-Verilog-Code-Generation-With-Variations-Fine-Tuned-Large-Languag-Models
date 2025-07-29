module nil(input [3:0] a);
reg [3:0] b;
reg [3:0] c;
initial
begin
a = 4'b0;
b = 4'b0;
c = 4'b0;
$display ("t=%0t display: a = %b, b = %b", $time, a, b);
end
always @* begin
if