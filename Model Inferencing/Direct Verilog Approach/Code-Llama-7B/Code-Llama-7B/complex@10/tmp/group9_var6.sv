```
// Function to determine product term value based on input
function [1:0] prod_term(input [1:0] in);  
  prod_term={p9, p8, p7, p6, p5, p4, p3, p2, p1};  
endfunction
$system$or$array(in, {p1,p2,p3,p4,p5,p6,p7,p8,p9}, out);
```
### Testbench:
```
module test_mltp_a;
  reg a1, a0, b1, b0;
  wire c1, c2, c3, c4;
  mltp_a dut(a1, a0, b1, b0, c1, c2, c3, c4);
  initial begin
    $monitor("%b%b * %b%b = %b%b%b%b", a1, a0, b1, b0, c1, c2, c3, c4); 
    $dumpvars(1);
    $dumpfile("dump.vcd");
    a1=0; a0=0; b1=0; b0=0; #10;
    a1=0; a0=0; b1=0; b0=1; #10;
    a1=0; a0=0; b1=1; b0=0; #10;
    a1=0; a0=0; b1=1; b0=1; #10;
    a1=0; a0=1; b1=0; b0=0; #10;
    a1=0; a0=1; b1=0; b0=1; #10;
    a1=0; a0=1; b1=1; b0=0; #10;
    a1=0; a0=1; b1=1; b0=1; #10;
    a1=1; a0=0; b1=0; b0=0; #10;
    a1=1; a0=0; b1=0; b0