module test_carry;
reg a, b, c;
integer i;
wire cout;
carry c1(cout, c, a, b);
generate
begin
{a, b, c} = i;
end
endgenerate
initial
begin
$monitor("time=%d a=%b b=%b c=%b---------cout=%b", $time, a, b, c, cout);
for (i = 0; i < 9; i = i + 1)
begin
{a, b, c} = i;
end
a = {c,c,1'b0};
b = {c,c,1'b0};
end
endmodule
### Output:
time=1 a=0 b=0 c=0---------cout=0
time=2 a=1 b=1 c=1---------cout=1
time=3 a=2 b=2 c=2---------cout=0
time=4 a=3 b=3 c=3---------cout=1
time=5 a=4 b=4 c=4---------cout=0
time=6 a=5 b=5 c=5---------cout=1
time=7 a=6 b=6 c=6---------cout=0
time=8 a=7 b=7 c=7---------cout=1
time=9 a=0 b=0 c=0---------cout=0
time=10 a=1 b=1 c=1---------cout=1
time=11 a=2 b=2 c=2---------cout=0
time=12 a=3 b=3 c=3---------cout=1
time=13 a=4 b=4 c=4---------cout=0
time=14 a=5 b=5 c=5---------cout=1
time=15 a=6 b=6 c=6---------cout=0
time=16 a=7 b=7 c=7---------cout=1
time=17 a=0 b=0 c=0---------cout=0
time=18 a=1 b=1 c=1---------cout=1
time=19 a=2 b=2 c=2---------cout=0
time=20 a=3 b=3 c=3---------cout=1
time=21 a=4 b=4 c=4---------cout=0
time=22 a=5 b=5 c=5---------cout=1
time=23 a=6 b=6 c=6---------cout=0
time=24 a=7 b=7 c=7---------cout=1
time=25 a=0 b=0 c=0---------cout=0
time=26 a=1 b=1 c=1---------cout=1
time=27 a=2 b=2 c=2---------cout=0
time=28 a=3 b=3 c=3---------cout=1
time=29 a=4 b=4 c=4---------cout=0
time=30 a=5 b=5 c=5---------cout=1
time=31 a=6 b=6 c=6---------cout=0
time=32 a=7 b=7 c=7---------cout=1
time=33 a=0 b=0 c=0---------cout=0
time=34 a=1 b=1 c=1---------cout=1
time=35 a=2 b=2 c=2---------cout=0
time=36 a=3 b=3