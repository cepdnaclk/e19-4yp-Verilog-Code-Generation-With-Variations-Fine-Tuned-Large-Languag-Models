module test_carry;
reg a, b, c;
integer i;
wire cout;
generate
for (genvar i = 0; i < 2; i++) begin
parameter [0:1] d[0:1] = '{1,0};
carry c1(cout, c, a, b);
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
end
endgenerate

endmodule