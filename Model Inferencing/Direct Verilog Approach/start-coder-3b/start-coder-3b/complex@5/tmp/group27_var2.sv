module test_carry;
reg a, b, c, d;
integer i;
wire cout;
wire c_onehot;
carry c1(cout, c, a, b);
carry c2(cout, d, a, b);
generate
`ifdef TEST_CARRY_IN`
carry c_in[9:0](cout, c, a, b);
endgenerate
initial
begin
c_onehot = 1'b0;
$monitor("time=%d a=%b b=%b c=%b c_onehot=%s---------cout=%b", $time, a, b, c, c_onehot, cout);
for (i = 0; i < 9; i = i + 1)
begin
{a, b, c} = i;
end
a = 'bx;
b = 'bx;
end
endmodule
### Variation Command:
If using gnu version, add the following line to the top of the testbench file:
```vhdl
`include "util.svh"
define TEST_CARRY_IN
```

## SystemVerilog
## C
## Verilog
## Hardware
## UVM
## Cocotb
## SystemVerilog
## UVM
## Verilog
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## SystemVerilog
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## Cocotb
## UVM
## Cocotb
## C++
## UVM
## UVM
## Test Placement
## UVM
## Cocotb
## UVM
## UVM
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## Verilog
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
## UVM
## UVM
## Test Placement
## UVM
## UVM
## UVM
## Cocotb
## SystemVerilog
## UVM
## UVM
## Test Placement
##