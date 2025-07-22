module tstha_9();
  reg a,b,clk; wire s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; clk=0; end
  always begin #5 a=1;b=0; clk=~clk; #5 a=0;b=1; clk=~clk; #5 a=1;b=1; clk=~clk; #5 a=0;b=0; clk=~clk; end
  initial $monitor($time, " clk = %b, a = %b, b = %b,out carry = %b, outsum = %b ", clk, a,b,ca,s);
  initial #30 $stop;
endmodule
### Result:
![HA_Struct](https://user-images.githubusercontent.com/86225291/124617420-96fa9280-de74-11eb-9f11-1945915c064f.JPG)
![HA_Clk](https://user-images.githubusercontent.com/86225291/124617637-dd06d680-de74-11eb-93f8-1297bc217f3c.JPG)