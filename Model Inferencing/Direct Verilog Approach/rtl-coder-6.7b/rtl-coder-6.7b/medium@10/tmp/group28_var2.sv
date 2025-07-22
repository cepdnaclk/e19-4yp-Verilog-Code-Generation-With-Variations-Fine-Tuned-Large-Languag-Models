module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
//initial begin
//o = ~&({a1,b1});
//end
assign o = ~&({a1,b1});
endmodule
### Verification:
### Testbench:
`include "aoibeh2.v"
module tb; // Testbench module
bit clk; // Clock
bit a1,a0,b1,b0; // DUT inputs
wire o; // DUT output
// DUT instantiation
aoibeh2 uut(o,{a1,a0},{b1,b0});
initial begin
#10 a1 = 0;a0 = 0;b1 = 0;b0 = 0;
#10 a1 = 0;a0 = 0;b1 = 0;b0 = 1;
#10 a1 = 0;a0 = 0;b1 = 1;b0 = 0;
#10 a1 = 0;a0 = 0;b1 = 1;b0 = 1;
#10 a1 = 0;a0 = 1;b1 = 0;b0 = 0;
#10 a1 = 0;a0 = 1;b1 = 0;b0 = 1;
#10 a1 = 0;a0 = 1;b1 = 1;b0 = 0;
#10 a1 = 0;a0 = 1;b1 = 1;b0 = 1;
#10 a1 = 1;a0 = 0;b1 = 0;b0 = 0;
#10 a1 = 1;a0 = 0;b1 = 0;b0 = 1;
#10 a1 = 1;a0 = 0;b1 = 1;b0 =