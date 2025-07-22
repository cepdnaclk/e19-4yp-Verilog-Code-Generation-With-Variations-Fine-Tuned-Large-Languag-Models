module test_div;
reg a, b, c;
reg [3:0] cout;
wire [3:0] cout_array;
integer i;
initial
begin
$monitor("time=%d a=%b b