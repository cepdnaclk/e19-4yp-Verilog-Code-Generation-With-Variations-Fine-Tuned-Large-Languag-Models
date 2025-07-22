module nil;
reg a;
initial
begin
a = 1;
end
always begin
assign a = b[1] | b[0]; // Part-select
$display ("t=%0t display: a = %b", $time, a); // Added time
end
endmodule
### Result:

t=0 display: a = 0
t=2 display: a = 1
t=5 display: a = 1
t=6 display: a = 1

## 题目十一

### Base Verilog Code:
module nil