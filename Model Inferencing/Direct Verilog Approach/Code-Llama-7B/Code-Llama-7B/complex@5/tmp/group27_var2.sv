module test_carry_2;
 reg a,b,c;
 integer i;
 wire cout;
 carry c1(cout, c, a, b);
 initial
 begin
 $monitor("time=%d a=%b b=%b c=%b---------cout=%b", $time, a, b, c, cout);
	for (i = 0; i < 9; i = i + 1)
	begin
	{a,b,c} = i;
 end
 end
 endmodule
#### Variation:
In the testbench, add a generate block and use the inside operator to check `d` against a constant array.
### Actual Result:
Time= -2 a=00 b=00 c=00---------cout=0
Time= -1 a=00 b=00 c=00---------cout=0
Time= 0 a=00 b=00 c=00---------cout=0
Time= 1 a=00 b=00 c=00---------cout=0
Time= 2 a=00 b=01 c=00---------cout=0
Time= 3 a=00 b=10 c=00---------cout=0
Time= 4 a=00 b=11 c=00---------cout=0
Time