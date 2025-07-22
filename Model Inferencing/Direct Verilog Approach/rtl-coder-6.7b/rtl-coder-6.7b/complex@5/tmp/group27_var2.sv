module test_latch;
reg clk, d;
integer i;
wire q;
latch l1(q, clk, d);
initial
begin
$monitor("time=%d d=%b---------------q=%b ", $time, d, q);
for (i = 0; i < 5; i = i + 1)
begin
{clk, d} = i;
end
end
endmodule