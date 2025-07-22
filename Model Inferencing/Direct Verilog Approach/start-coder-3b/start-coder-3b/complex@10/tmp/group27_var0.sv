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
assign a = i;
assign b = i;
end
for (i = 0; i < 8; i = i + 1)
begin
assign a[i] = 0;
assign b[i] = 0;
assign a[i] = 1;
assert (cout = 0);
assign b[i] = 0;
assign b[i] = 1;
assert (cout = 1);
end
a = 'bx;
b = 'bx;
end
initial
begin
$monitor("time=%d a=%b b=%b c=%b---------cout=%b", $time, a, b, c, cout);
assign a = 0;
assign b = 0;
end
assign a = 1;
assign b = 1;
end
assign a = 2;
assign b = 2;
end
assign a = 3;
assign b = 3;
end
assign a = 4;
assign b = 4;
end
assign a = 5;
assign b = 5;
end
assign a = 6;
assign b = 6;
end
assign a = 7;
assign b = 7;
end
assign a = 8;
assign b = 8;
end
assign a = 9;
assign b = 9;
end
end
### Testbench Output:
time=0 a=0 b=0 c=5 cout=1
time=100 a=1 b=1 c=6 cout=1
time=200 a=2 b=2 c=7 cout=1
time=300 a=3 b=3 c=8 cout=1