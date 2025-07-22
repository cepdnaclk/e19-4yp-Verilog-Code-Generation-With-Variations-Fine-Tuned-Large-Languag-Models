module test_carry;
reg [2:0] a, b, c;
integer i;
wire cout;
carry c1(cout, c, a, b);
initial
begin
$monitor("time=%d a=%b b=%b c=%b---------cout=%b", $time, a, b, c, cout);
generate
for (i = 0; i < 9; i = i + 1)
begin
assign a = i;
assign b = i;
end
end
generate
for (i = 0; i < 4; i = i + 1)
begin
assign a = i;
assign b = i;
end
assign a = 'bx;
assign b = 'bx;
endgenerate
endmodule

```
Upvotes: -1