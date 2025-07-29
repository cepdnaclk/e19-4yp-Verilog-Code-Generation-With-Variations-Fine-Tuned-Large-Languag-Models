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
### Testbench Code:
module top;
wire d;
generate
test_carry tc(d);
endgenerate
initial
$monitor("d=%b", d);
endmodule
### Simulation result:
![simulation result](https://raw.githubusercontent.com/YudongC/YudongC.github.io/master/images/201803/simulation.png)
### Discussion:
#### Code Modification:
- The latch testbench is modified to use `generate` and `endgenerate` and no longer uses `initial` and `always`
- Inside generate block, we can use `test_carry tc(d);` to test the circuit.
- The output `d` is not defined and so the testbench does not show the result
- If you want to test the circuit, you have to define the `d` signal yourself.
- The circuit is shown below:
![simulation result](https://raw.githubusercontent.com/YudongC/YudongC.github.io/master/images/201803/circuit.png)
#### Problem in using