module nil;
reg a, b;
initial
begin
a = 1'b0;
b = 1'b0;
if (a[1])
b = b[1];
end
endmodule
### Simulation Results:
t=0.000000 display: a = 0, b = 0
t=2.000000 display: a = 0, b = 0
t=5.000000 display: a = 0, b = 0
t=6.000000 monitor: a = 0, b = 0

## Explanation

In this example, a conditional expression is used to control access to a part-select. The conditional expression uses [1] to select the LSB of a, which is a 1 bit wide, array. The b part-select is a reference to the right bit of a.

## See Also

For more information, see the following topics:

• Verilog User Guide: Conditional Statement in an Always Block
• Verilog User Guide: Part Select on an Array