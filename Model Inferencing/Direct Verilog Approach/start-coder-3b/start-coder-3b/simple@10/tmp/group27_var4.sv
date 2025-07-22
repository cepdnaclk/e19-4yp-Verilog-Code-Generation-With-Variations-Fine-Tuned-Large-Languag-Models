module tstha_13();
  reg a,b; wire s,ca;
  ha_13 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  wire clk[2];
  initial begin a=0;b=0; clk[0]=1;clk[1]=0; end
  always #5 begin a=1;b=0; clk[0]=1;clk[1]=0; end
  always #5 begin a=0;b=1; clk[0]=1;clk[1]=0; end
  always #5 begin a=1;b=1; clk[0]=1;clk[1]=0; end
  always #5 begin a=0;b=0; clk[0]=1;clk[1]=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
endmodule

### Base Verilog Code:
module tstha_14();
  reg a,b; wire s,ca;
  ha_14 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
endmodule
### Variation Instruction:
Modify the