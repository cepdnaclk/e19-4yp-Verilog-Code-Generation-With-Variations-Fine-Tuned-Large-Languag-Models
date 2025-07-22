module nil;
reg [31:0] a, b;
initial
begin
a = 1'b0;
b = 1'b1;
$display ("t=%0t display: a = %b, b = %b", $time, a, b);
// $display ("t=%0t display: a = %b, b = %b", $time, a[1:0], b); // Added part-select
end
initial
$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b);
// Monitor triggers at t=0, t=2, t=5, t=6
endmodule
### References:
https://www.reddit.com/r/Verilog/comments/8vftl5/what_is_the_purpose_of_using_a_partselect_while/

### Result:
### Time:
### Display:
t=0 display: a = 0, b = 0
### Monitor:
t=0 monitor: a = 0, b = 0

### Variation Time:
### Variation Display:
t=0 display: a = 0, b = 1
t=0 display: a = 0, b = 0
### Variation Monitor:
t=0 monitor: a = 0, b = 1
t=0 monitor: a = 0, b = 0