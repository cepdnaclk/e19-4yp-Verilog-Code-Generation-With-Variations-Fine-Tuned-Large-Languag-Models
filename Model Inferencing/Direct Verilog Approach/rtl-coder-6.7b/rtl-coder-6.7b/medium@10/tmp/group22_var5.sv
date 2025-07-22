module nil;
reg a, b;
initial
begin
a = 1'b0;
b = 1'b0;
$display ("t=%0t display: a = %b, b = %b", $time, a, b); // Added time
end
initial
begin
if (a[0])
// Error: part select in an always block.
begin
$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b);
end
end
endmodule
### Base Verilog Code:
module nil;
reg a, b;
initial
begin
a = 1'b0;
b = 1'b0;
$display ("t=%0t display: a = %b, b = %b", $time, a, b); // Added time
end
initial
begin
if (a[0])
begin
$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b);
end
end
endmodule