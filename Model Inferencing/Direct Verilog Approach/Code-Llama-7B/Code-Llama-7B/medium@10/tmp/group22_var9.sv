module nil;
reg [7:0] a, b;
always @(*)
begin
if (a[0] || b[0])
c = 1'b1; // c = 1'b1
else
c = 1'b0; // c = 1'b0
end
initial
begin
a = 8'b01110101;
b = 8'b01010110;
end
initial
$monitor("t=%0t monitor: c = %b", $time, c); // Added time
endmodule
#### Testbench:
module tb_nil;

reg
t;
initial
begin
t = 0;
end

always @(t)
begin
#10 t = ~t;
re
end

initial
begin
#10 $finish;
end

endmodule
#### Output:
t=0 monitor: c = 0
t=10 monitor: c = 1
t=20 monitor: c = 0
t=30 monitor: c = 0
t=40 monitor: c = 0
t=50 monitor: c = 0
t=60 monitor: c = 0
t=70 monitor: c = 0
t=80 monitor: c = 0
t=90 monitor: c = 0
t=100 monitor: c = 0
t=110 monitor: c = 0
t=120 monitor: c = 0
t=130 monitor: