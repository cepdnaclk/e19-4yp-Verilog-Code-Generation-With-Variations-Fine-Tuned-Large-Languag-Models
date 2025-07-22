`include "ha_9.v" // Include HA
module tstha_9();
  reg clk;
  struct packed{reg a,b; } ab;
  ha_9 hh(ab.a,ab.b); // Instantiate HA with rise/fall path delays
  initial clk = 0;
  initial ab.a = 0; ab.b = 0;
  always #5 clk = ~clk;
  always  #7 ab.a = 1 - ab.a;
  always #11 ab.b = 1 - ab.b;
  initial $monitor($time, " in ab.a = %b, in ab.b = %b,out ab.a = %b, out ab.b = %b ",ab.a,ab.b,ab.a,ab.b);
  initial #30 $stop;
endmodule
### Code Output:
`include "ha_9.v"
module tstha_9();
  reg a,b; wire s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
endmodule