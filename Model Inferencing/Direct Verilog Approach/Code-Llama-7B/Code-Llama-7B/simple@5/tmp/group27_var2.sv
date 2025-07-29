module tstha_9a();
  reg a,b; wire s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
endmodule
### Modification:
- Make clk to come from a packed structure
### Variation Verilog Code:
module tstha_9a();
  reg a,b; wire s,ca;
  packed struct {logic c;logic d;} hh;
  ha_9 hh(hh.c,hh.d,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,hh.c,hh.d);
  initial #30 $stop;
endmodule
### Result:
- Pass
### Instructor Notes:
- If you do not understand the use of a packed struct, read:


### Suggested Reading:
- [IEEE Std 1800-2017](https://standards.ieee.org/findstds/standard/1800-2017.html) section 21.8.4.3 (12.3.2.1)
- [IEEE Std 1800-2012](https://standards.ieee.org/findstds/standard/