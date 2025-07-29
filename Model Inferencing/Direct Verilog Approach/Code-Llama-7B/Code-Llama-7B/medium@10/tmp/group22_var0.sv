module nil;
reg a, b;
initial
begin
a = 1'b0;
b = 1'b0;
$display ("t=%0t display: a = %b, b = %b", $time, a, b); // Modified
end
initial
if (a)
begin
$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b);
end
// Monitor triggers at t=0, t=2, t=5, t=6
endmodule
### Expected Output:
t=0 display: a = 0, b = 0
t=2 display: a = 1, b = 1
t=5 display: a = 1, b = 1
t=6 display: a = 0, b = 0
### Simulation Log:
t