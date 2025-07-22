module test_carry;
reg a, b, c;
integer i;
wire cout;
wire c_out;
decoder d1(d, c);
initial
begin
$monitor("time=%d a=%b b=%b c=%b---------cout=%b", $time, a, b, c, cout);
for (i = 0; i < 9; i = i + 1)
begin
{a, b, c} = i;
end
generate
begin
assign c[i] = cout;
end
endmodule
### Test Output:
time=0  a=0 b=0 c=00000000---------cout=0
time=1  a=0 b=0 c=00000001---------cout=0
time=2  a=0 b=0 c=00000010---------cout=0
time=3  a=0 b=0 c=00000100---------cout=0
time=4  a=0 b=0 c=00001000---------cout=0
time=5  a=0 b=1 c=00010000---------cout=1
time=6  a=0 b=1 c=00100000---------cout=0
time=7  a=0 b=1 c=01000000---------cout=0
time=8  a=1 b=0 c=10000000---------cout=0
### Test Result:
![Test Result](test3.png)

#### Test 4 - Sum Adder
In the base verilog code, a sum adder is implemented using a 2-to-4 Decoder and carry adder. The sum adder is implemented using the `sumadder24` module. The sum adder code is as follows:
```verilog
module sumadder(out, sel);
input [1:0] sel;