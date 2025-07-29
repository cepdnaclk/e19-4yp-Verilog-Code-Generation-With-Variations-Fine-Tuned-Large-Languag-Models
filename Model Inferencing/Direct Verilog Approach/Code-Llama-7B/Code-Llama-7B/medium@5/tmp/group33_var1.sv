module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw[1:0](out,in,con);
  initial begin in=1'b0; con=1'b1; end
  always #5 in =~in;
  always #3 con=~con;
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop;
endmodule
### Expected Result:
Passes
### Actual Results:
#### Test 1:
```verilog
module CMOSsw1(
  output out,
  input in,
  input con
);
  assign out=con?in:1'bz;
endmodule
```
#### Test 2:
```verilog
module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw[1:0](out,in,con);
  initial begin in=1'b0; con=1'b1; end
  always #5 in =~in;
  always #3 con=~con;
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop;
endmodule
```
#### Actual Output:
```
$ vvv
vvv 2>&1
+ /usr/local/bin/vvv tst_CMOSsw1.vvv
+ /usr/local/bin/vvv tst_CMOSsw1.vvv
in = 0, con = 0, output = z 
+ /usr/local/bin/iverilog -o tst_CMOSsw1.out -c./tst_CMOSsw1.vvv
+ /usr/local/bin/iverilog -o tst_CMOSsw1.out -c./tst_CMOSsw1.vvv
+ /usr/local/bin/vvp tst_CMOSsw1.out
+ /usr/local/bin/vvp tst_CMOSsw1.out
in = 1, con = 0, output = z 
in = 0, con = 1, output = z 
in = 1, con = 1, output = z 
in = 0, con = 0, output = z 
in = 1, con = 0, output = z 
+ 10:20:02 /usr/local/Cellar/iverilog/11.0/bin/iverilog -o tst_CMOSsw1.out -c./tst_CMOSsw1.vvv
Error: tst_CMOSsw1.vvv(11): near "s": syntax error
```
#### Test 3:
```verilog
module CMOSsw1(
  output out,
  input in,
  input con
);
  assign out=con?in:1'bz;
endmodule
```
#### Test 4:
```verilog
module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw[1:0](out,in,con);
  initial begin in=1'b0; con=1'b1; end
  always #5 in =~in;
  always #3 con=~con;
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop;
endmodule
```
#### Actual Output:
```
$ vvv
vvv 2>&1
+ /usr/local/bin/vvv tst_CMOSsw1.vvv
+ /usr/local/bin/vvv tst_CMOSsw1.vvv
in = 0, con = 0, output = z 
+ /usr/local/bin/iverilog -o tst_CMOSsw1.out -c./tst_CMOSsw1.vvv
+ /usr/local/bin/iverilog -o tst_CMOSsw1.out -c./tst_CMOSsw1.vvv
in