module test_carry; 
reg a, b, c, d;
integer i;
wire [3:0] y;
wire [2:0] z;
wire cout;
carry2 c4(z, a, b, c);
always @(*)
begin
y = {a, c