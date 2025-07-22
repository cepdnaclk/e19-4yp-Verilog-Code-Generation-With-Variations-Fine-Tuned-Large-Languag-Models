module nil;
reg a, b;
initial
begin
a = 1'b0;
b = 1'b0;
$display ("t=%0t display: a = %b, b = %b", $time, a, b); // Added time
end
always @ (a && b)
begin
$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b);
end
// Monitor triggers at t=0, t=2, t=5, t=6
endmodule

### Example 8:

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
$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b);
// Monitor triggers at t=0, t=2, t=5, t=6
endmodule
### Variation Instruction