```verilog
// Verilog code:

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
```


```verilog
// Testbench code:

`define  WORD_WIDTH 2
`define  NUM_INPUTS (2**(`WORD_WIDTH))

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

generate
for(genvar idx=0; idx<`NUM_INPUTS; idx++)
begin
initial assert(cout == {a, b, c}[idx]) $display("Assertion Passed");
end
endgenerate
endmodule
```
> **Note:** The `inside` operator returns 1 if `a` is inside the range and 0 otherwise.

### Result:

```verilog
time=0 a=b0 b=b0 c=b0---------cout=b0
time=10 a=b0 b=b1 c=b0---------cout=b0
time=20 a=b0 b=b1 c=b1---------cout=b1
time=30 a=b1 b=b0 c=b0---------cout=b0
time=40