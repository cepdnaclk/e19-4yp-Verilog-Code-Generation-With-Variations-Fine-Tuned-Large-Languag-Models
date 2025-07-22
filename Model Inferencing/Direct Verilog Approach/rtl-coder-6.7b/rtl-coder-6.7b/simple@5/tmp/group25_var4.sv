module mos_strength (a, c, zn, zp);
input [1:0] a; // a is bit vector with two bits
input c; // c is bit
output [1:0] zn, zp; // zn and zp are bit vectors with two bits
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
### Modified Verilog Testbench:
module testbench ();
reg [1:0] a;
reg c;
wire [1:0] zn, zp;
initial begin
a=2'b00; #900;
a=2'b01; #900;
a=2'b10; #900;
a=2'b11; #900;
c=1'b0; #900; c=1'b1; // change c
a=2'b00; #900;
a=2'b01; #900;
a=2'b10; #900;
a=2'b11; #900;
c=1'b0; #900; c=1'b1; // change c
$finish;
end
endmodule
### Modified Testbench Output:
### Output of the following command:
iverilog -o testbench-enums testbench-enums.sv && vvp testbench-enums
### Verilog Std. 2001
###
### Output of the following command:
ivl_hier -o testbench-enums testbench-enums.sv && vvp testbench-enums
### Verilog Std. 2005