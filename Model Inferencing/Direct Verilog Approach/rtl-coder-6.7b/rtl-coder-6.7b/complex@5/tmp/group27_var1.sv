module carry(cout, c, a, b);
input a, b, c;
output cout;
wire s;
xor u1(s, c, a);
xor u2(cout, s, b);
endmodule
interface carry(cout, c, a, b);
input a, b, c;
output cout;
endinterface
module test_carry;
reg a, b, c;
integer i;
wire cout;
carry c1(cout, c, a, b);
generate
begin: gen_code
for (i = 0; i < 9; i = i + 1)
begin: gen_block
initial
begin
$monitor("time=%d a=%b b=%b c=%b---------cout=%b", $time, a, b, c, cout);
c1.c = i;
end
end
end
endgenerate
endmodule