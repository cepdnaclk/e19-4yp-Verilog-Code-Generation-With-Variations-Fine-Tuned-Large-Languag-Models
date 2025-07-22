```verilog
module nil;
reg [3:0] a;
initial
begin
a = 4'b0000;
$display ("t=%0t display: a = %b", $time, a); 
end
always @(a)
begin
if (a[3:2] == 2'b00)
begin
a[3:2] = 2'b11;
$display ("t=%0t display: a = %b", $time, a);
end
end
initial
$monitor("t=%0t monitor: a = %b", $time, a);
// Monitor triggers at t=0, t=2, t=5, t=6
endmodule
```
In this code, `a[3:2]` is a part-select on the 4 bit array "a". This refers to the bits 2 and 3 of the array. If the part-select matches `2'b00`, it will be changed to `2'b11`, and the new value of `a` will be displayed in the monitor and display sections.

This code will display "t=0 monitor: a = 0000" and "t=2 display: a = 0111" because at time 2, the part-select "a[3:2]" equals 2'b00, so it is changed to `2'b11`, triggering the monitor and display to display these new values. 

Similarly, "t=5 monitor: a = 0111" and "t=6 display: a = 0111" will occur. 

"t=0 display: a = 0000" occurs because at time 0, the initial block is executed and the initial value of 'a' is displayed.

"t=6 monitor: a = 0111" occurs because at time 6, the part-select "a[3:2]" equals 2'b00 again, it's changed to `2'b11`, triggering the monitor. 

This is just an example, the conditions and part-select value might need to be changed according to your needs. Note, that part-selects on arrays in Verilog should