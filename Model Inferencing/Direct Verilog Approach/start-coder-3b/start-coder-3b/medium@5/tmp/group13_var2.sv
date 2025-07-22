$display("hello world"); ### Conclusion:$display() is used to display output on the terminal with the usual syntax.

## 2019-04-26

### Base Verilog Code:

### Variation Instruction:

Use $display(). ### Modified Code:$display("hello world");

### Conclusion:

$display() is used to display output on the terminal with the usual syntax. ## 2019-04-23 ### Base Verilog Code: module tst_xor1; reg i1,i2; wire o; xor1 xx(i1,i2,o); initial begin i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (xor rule) end initial$monitor(\$time,"i1=%b,i2=%b,o=%b",i1,i2,o);

initial
$stop; // Added stop endmodule ### Variation Instruction: Use wire and wire declaration, no changes or re-assignments. ### Modified Code: module tst_xor1; //testbench wire i1; wire i2; wire o; xor1 xx(i1,i2,o); //wire declaration // xor1 xx(i1,i2,o); initial begin i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (xor rule) end initial$monitor(\$time,"i1=%b,i2=%b,o=%b",i1,i2,o);

initial
$stop; // Added stop endmodule ### Conclusion: No change, wire and wire declaration, is the same as wire i1 = 0, i2 = 0;. ## 2019-04-23 ### Base Verilog Code: module tst_xor1; reg i1,i2; wire o; xor1 xx(i1,i2,o); initial begin i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (xor rule) end initial$monitor(\$time,"i1=%b,i2=%b,o=%b",i1,i2,o);

initial
$stop; // Added stop endmodule ### Variation Instruction: Use wire and wire declaration, no changes or re-assignments. ### Modified Code: module tst_xor1; //testbench wire i1; wire i2; wire o; xor1 xx(i1,i2,o); //wire declaration // xor1 xx(i1,i2,o); initial begin i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (xor rule) end initial$monitor(\$time,"i1=%b,i2=%b,o=%b",i1,i2,o);

initial
$stop; // Added stop endmodule ### Conclusion: No change, wire and wire declaration, is the same as wire i1 = 0, i2 = 0;. # Appendix ## 2019-04-23 ### Base Verilog Code: module tst_xor1; reg i1,i2; wire o; xor1 xx(i1,i2,o); initial begin i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (xor rule) end initial$monitor(\$time,"i1=%b,i2=%b,o=%b",i1,i2,o);

initial
$stop; // Added stop endmodule ### Variation Instruction: Use assign statement. ### Modified Code: module tst_xor1; //testbench wire i1; assign i1 = 0; wire i2; assign i2 = 0; //wire declaration wire o; xor1 xx(i1,i2,o); initial begin i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (xor rule) end initial$monitor(\$time,"i1=%b,i2=%b,o=%b",i1,i2,o);

initial
$stop; // Added stop endmodule ### Conclusion: No change, the code is self evident after the initial statement. ## 2019-04-23 ### Base Verilog Code: module tst_xor1; reg i1,i2; wire o; xor1 xx(i1,i2,o); initial begin i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (xor rule) end initial$monitor(\$time,"i1=%b,i2=%b,o=%b",i1,i2,o);

initial
$stop; // Added stop endmodule