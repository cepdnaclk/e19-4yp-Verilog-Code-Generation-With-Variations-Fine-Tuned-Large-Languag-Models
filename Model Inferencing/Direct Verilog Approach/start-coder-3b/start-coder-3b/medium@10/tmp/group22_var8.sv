module nil;
reg [2:0] a;
reg b;
initial
begin
a = 3'b0;
b = 1'b0;
$display ("t=%0t display: a[1:0] = %b, b = %b", $time, a[1:0], b); // Added