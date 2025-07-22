module nil;
reg a, b;
initial
begin
a = 1'b0;
b = 1'b0;
$display ("t=%0t display: a = %b, b = %b", $time, a, b);
end
initial
begin
always @(*)
$display("t=%0t display: a = %b, b = %b", $time, a, b);
end
initial
$monitor("t=%