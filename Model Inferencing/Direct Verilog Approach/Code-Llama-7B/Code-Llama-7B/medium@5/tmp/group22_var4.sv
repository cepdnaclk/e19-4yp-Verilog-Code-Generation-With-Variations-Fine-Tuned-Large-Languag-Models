module nil;
reg a, b;
/*variable*/ int c;
always @(a, b) // Instantiated here
begin
c = a? b : 0; // Triggers conditional expression
$display ("t=%0t display: a = %b, b = %b, c = %b", $time, a, b, c); // Added time
end
initial
begin
a = 1'b0;
b = 1'b0;
end
initial
$monitor("t=%0t monitor: a = %b, b = %b, c = %b", $time, a, b, c);