module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = case (s)
2'b00 : c[0]
2'b01 : c[1]
2'b10 : c[2]
2'b11 : c[3];
endcase
endmodule
## Exercise 2
This exercise will have you create a file “verilog.txt” with a list of all verilog modules in the “modules” directory.
## Solution:

### Base Verilog Code:
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
| ~s[1] & s[0] & c[1] // Select c[1] when s=01
| s[1] & ~s[0] & c[2] // Select c[2] when s=10
| s[1] & s[0] & c[3]; // Select c[3] when s=11
endmodule
### Variation Instruction:
Add $write_verilog to the file “verilog.txt”.
### Variation Code:
$write_verilog mux41b.v
## Exercise 3
This exercise will have you change the file “verilog.txt” to include a list of all verilog modules in the “modules” directory as well as the “components” directory.
## Solution:

### Base Verilog Code:
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
| ~s[1] & s[0] & c[1] // Select c[1] when s=01
| s[1] & ~s[0] & c[2] // Select c[2] when s=10
| s[1] & s[0] & c[3]; // Select c[3] when s=11
endmodule
### Variation Instruction:
Add $write_verilog to the file “verilog.txt”.
### Variation Code:
$write_verilog modules/*
$write_verilog components/*
## Exercise 4
This exercise will have you create a file “vunit.txt” with a list of all vunit modules in the “modules” directory.
## Solution:

### Base Verilog Code:
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
| ~s[1] & s[0] & c[1] // Select c[1] when s=01
| s[1] & ~s[0] & c[2] // Select c[2] when s=10
| s[1] & s[0] & c[3]; // Select c[3] when s=11
endmodule
### Variation Instruction:
Add $write_vunit to the file “verilog.txt”.
### Variation Code:
$write_vunit modules/*
## Exercise 5
This exercise will have you change the file “vunit.txt” to include a list of all vunit modules in the “modules” directory as well as the “components” directory.
## Solution:

### Base Verilog Code:
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
| ~s[1] & s[0] & c[1] // Select c[1] when s=01
| s[1] & ~s[0] & c[2] // Select c[2] when s=10
| s[1] & s[0] & c[3]; // Select c[3] when s=11
endmodule
### Variation Instruction:
Add $write_vunit to the file “verilog.txt”.
### Variation Code:
$write_vunit modules/*
$write_vunit components/*
## Exercise 6
This exercise will have you create a file “test.txt” with a list of all regression test cases.
## Solution:

### Base Verilog Code:
module mux41b_tb (
);

initial begin
$dumpfile("mux41b.vcd")$dumpvars(0, mux41b)

$strobe #10 mux41b.c = 2'b00;$cycle
$strobe #10 mux41b.s = 2'b00;$cycle

$strobe #10 mux41b.c = 2'b01;$cycle
$strobe #10 mux41b.s = 2'b00;$cycle

$strobe #10 mux41b.c = 2'b10;$cycle
$strobe #10 mux41b.s = 2'b00;$cycle

$strobe #10 mux41b.c = 2'b11;$cycle
$strobe #10 mux41b.s = 2'b00;$cycle

$strobe #10 mux41b.c = 2'b00;$cycle
$strobe #10 mux41b.s = 2'b10;$cycle

$strobe #10 mux41b.c = 2'b00;$cycle
$strobe #10 mux41b.s = 2'b11;$cycle

$strobe #10 mux41b.c = 2'b01;$cycle
$strobe #10 mux41b.s = 2'b10;$cycle

$strobe #10 mux41b.c = 2'b01;$cycle
$strobe #10 mux41b.s = 2'b11;$cycle

$strobe #10 mux41b.c = 2'b10;$cycle
$strobe #10 mux41b.s = 2'b10;$cycle

$strobe #10 mux41b.c = 2'b10;$cycle
$strobe #10 mux41b.s = 2'b11;$cycle

$strobe #10 mux41b.c = 2'b11;$cycle
$strobe #10 mux41b.s = 2'b10;$cycle

$strobe #10 mux41b.c = 2'b11;$cycle
$strobe #10 mux41b.s = 2'b11;$cycle

$finish endmodule ### Variation Instruction: Add$write_test to the file “test.txt”.
### Variation Code:
$write_test test_suite/* ## Exercise 7 This exercise will have you create a file “test.v” with all regression test modules. ## Solution: ### Base Verilog Code: module mux41b_tb ( ); initial begin$dumpfile("mux41b.vcd")
$dumpvars(0, mux41b) $strobe #10 mux41b.c = 2'b00;
$cycle$strobe #10 mux41b.s = 2'b00;
$cycle$strobe #10 mux41b.c = 2'b01;
$cycle$strobe #10 mux41b.s = 2'b00;
$cycle$strobe #10 mux41b.c = 2'b10;
$cycle$strobe #10 mux41b.s = 2'b00;
$cycle$strobe #10 mux41b.c = 2'b11;
$cycle$strobe #10 mux41b.s = 2'b00;
$cycle$strobe #10 mux41b.c = 2'b00;
$cycle$strobe #10 mux41b.s = 2'b10;
$cycle$strobe #10 mux41b.c = 2'b00;
$cycle$strobe #10 mux41b