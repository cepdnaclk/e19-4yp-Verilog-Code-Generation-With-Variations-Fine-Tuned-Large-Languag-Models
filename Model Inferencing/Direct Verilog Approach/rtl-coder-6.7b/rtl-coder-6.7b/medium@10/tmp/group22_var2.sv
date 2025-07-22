module nil;
reg a, b;
initial
begin
#100;
a[3:0] = 4'b0110;
b = 1'b0;
$display ("t=%0t display: a = %b, b = %b", $time, a, b); 
end
initial
$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b);
endmodule
### Output:
t=0 monitor: a = 0000, b = 0
t=1 monitor: a = 0000, b = 0
t=2 monitor: a = 0000, b = 0
t=3 monitor: a = 0000, b = 0
t=4 monitor: a = 0110, b = 0
t=5 monitor: a = 0110, b = 0
t=6 monitor: a = 0110, b = 0
t=7 monitor: a = 0110, b = 0
t=8 monitor: a = 0110, b = 0
t=9 monitor: a = 0110, b = 0
t=10 monitor: a = 0110, b = 0
t=11 monitor: a = 0110, b = 0
t=12 monitor: a = 0110, b = 0
t=13 monitor: a = 0110, b = 0
t=14 monitor: a = 0110, b = 0
t=15 monitor: a = 0110, b = 0
t=16 monitor: a = 0110, b = 0
t=17 monitor: a = 0110, b = 0
t=18 monitor: a = 0110, b = 0
t=19 monitor: a = 0110, b = 0
t=20 monitor: a = 0110, b = 0
t=21 monitor: a = 0110, b = 0
t=22 monitor: a = 0110, b = 0
t=23 monitor: a = 0110, b = 0
t=