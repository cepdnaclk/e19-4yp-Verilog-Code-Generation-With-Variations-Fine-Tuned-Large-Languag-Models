module test_carry;
reg a, b, c;
integer i;
wire cout;
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
endmodule
The results of the testbench are:

time=0 a=0 b=0 c=0---------cout=0
time=100 a=0 b=1 c=1---------cout=1
time=200 a=0 b=2 c=2---------cout=0
time=300 a=0 b=3 c=3---------cout=1
time=400 a=0 b=4 c=4---------cout=0
time=500 a=0 b=5 c=5---------cout=1
time=600 a=0 b=6 c=6---------cout=0
time=700 a=0 b=7 c=7---------cout=1
time=800 a=0 b=8 c=8---------cout=0
time=900 a=0 b=9 c=9---------cout=1
time=1000 a=x b=0 c=x---------cout=x
time=1010 a=x b=1 c=0---------cout=x
time=1020 a=x b=2 c=0---------cout=x
time=1030 a=x b=3 c=0---------cout=x
time=1040 a=x b=