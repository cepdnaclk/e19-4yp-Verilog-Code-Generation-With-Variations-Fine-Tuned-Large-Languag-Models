module test_carry;
reg a, b, c;
integer i;
wire cout;
generate
carry c1(cout, c, a, b);
endgenerate
initial
begin
$monitor("time=%d a=%b b=%b c=%b---------cout=%b", $time, a, b, c, cout);
for (i = 0; i < 9; i = i + 1)
begin
{a, b, c} = i;
end
a = 'bx;
b = 'bx;
end
endmodule
### Test Strategy:
### Results:
### Questions:
### Conclusion: