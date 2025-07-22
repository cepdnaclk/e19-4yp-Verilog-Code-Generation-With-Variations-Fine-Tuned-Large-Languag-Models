```
module gade(input b,c,b1,c1);
parameter
int gg4[2][2] = 1;
output [1:0][0:1] a,a1;
// Instantiate 2-bit OR gate with delay 3
or #3 gg1((gg4[1]),({c1,b1}));
// Instantiate 2-bit AND gate with rise=2, fall=1 delay
and #(2,1)gg3((gg4[0]),({c,b}));
assign a = gg4[0];
assign a1 = gg4[1];
endmodule
```
## 3. Testbench
```
// Testbench for gade
`timescale 1ns/100ps
module gade_tb;
reg b,c,b1,c1;
wire [1:0][0:1] a,a1;
// Instantiate DUT
gade gg(b,c,b1,c1,a,a1);
initial begin
$display("starting simulation");
// Run a few test cases
// Test case 1, all zeros
#10 b = 0;
c = 0;
b1 = 0;
c1 = 0;
$display("b%b c%b b1%b c1%b a%b a1%b",b,c,b1,c1,a,a1);
// Test case 2, all ones
#10 b = 1;
c = 1;
b1 = 1;
c1 = 1;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 3, b = 0, c = 1, b1 = 0, c1 = 1
#10 b = 0;
c = 1;
b1 = 0;
c1 = 1;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 4, b = 0, c = 0, b1 = 1, c1 = 1
#10 b = 0;
c = 0;
b1 = 1;
c1 = 1;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 5, b = 1, c = 0, b1 = 1, c1 = 0
#10 b = 1;
c = 0;
b1 = 1;
c1 = 0;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 6, b = 1, c = 1, b1 = 0, c1 = 0
#10 b = 1;
c = 1;
b1 = 0;
c1 = 0;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 7, b = 1, c = 0, b1 = 0, c1 = 0
#10 b = 1;
c = 0;
b1 = 0;
c1 = 0;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 8, b = 0, c = 1, b1 = 1, c1 = 0
#10 b = 0;
c = 1;
b1 = 1;
c1 = 0;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 9, b = 0, c = 0, b1 = 0, c1 = 1
#10 b = 0;
c = 0;
b1 = 0;
c1 = 1;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 10, b = 1, c = 1, b1 = 1, c1 = 1
#10 b = 1;
c = 1;
b1 = 1;
c1 = 1;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
$display("simulation done");
end
endmodule
```
## 3. Output
```
starting simulation
b0000 c0000 b1000 c1000 a0000 a1000
b0000 c0000 b1000 c1000 a0000 a1000
b0000 c0000 b1000 c1000 a0000 a1000
b0000 c0000 b1000 c1000 a0000 a1000
b0000 c0000 b1000 c1000 a0000 a1000
b0000 c0000 b1000 c1000 a0000 a1000
b0000 c0000 b1000 c1000 a0000 a1000
b0000 c0000 b1000 c1000 a0000 a1000
b0000 c0000 b1000 c1000 a0000 a1000
b0000 c0000 b1000 c1000 a0000 a1000
simulation done
```
```
// Testbench for gade
`timescale 1ns/100ps
module gade_tb;
reg b,c,b1,c1;
wire [1:0][0:1] a,a1;
// Instantiate DUT
gade gg(b,c,b1,c1,a,a1);
initial begin
$display("starting simulation");
// Run a few test cases
// Test case 1, all zeros
#10 b = 0;
c = 0;
b1 = 0;
c1 = 0;
$display("b%b c%b b1%b c1%b a%b a1%b",b,c,b1,c1,a,a1);
// Test case 2, all ones
#10 b = 1;
c = 1;
b1 = 1;
c1 = 1;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 3, b = 0, c = 1, b1 = 0, c1 = 1
#10 b = 0;
c = 1;
b1 = 0;
c1 = 1;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 4, b = 0, c = 0, b1 = 1, c1 = 1
#10 b = 0;
c = 0;
b1 = 1;
c1 = 1;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 5, b = 1, c = 0, b1 = 1, c1 = 0
#10 b = 1;
c = 0;
b1 = 1;
c1 = 0;
$display("b%b c%b b1%b c1%b a%b a1%b",
b,c,b1,c1,a,a1);
// Test case 6, b = 1, c = 1, b1 = 0, c1 = 0
#10 b = 1;
c