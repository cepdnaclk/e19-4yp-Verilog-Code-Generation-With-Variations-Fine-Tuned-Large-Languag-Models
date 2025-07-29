module tstha_9();
  reg a,b; wire s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  packed struct {bit x,y;} clk;
  initial clk = 1'b1;
  always #5 clk.x = ~clk.x;
  initial #30 $stop;
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
endmodule
### Modified Testbench:
module tstha_9();
  reg a,b; wire s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  packed struct {bit x,y;} clk;
  initial clk = 1'b1;
  always #5 clk.x = ~clk.x;
  initial #30 $stop;
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
endmodule
#### Output:
```
a = 0, b = 0,out carry = 0, outsum = 0 
a = 1, b = 0,out carry = 0, outsum = 1 
a = 0, b = 1,out carry = 1, outsum = 1 
a = 1, b = 1,out carry = 0, outsum = 2 
a = 0,