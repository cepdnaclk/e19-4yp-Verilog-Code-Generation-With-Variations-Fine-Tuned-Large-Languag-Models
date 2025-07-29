module tstha_9(clock,a,b);
  parameter P_CLK_PERIOD = 5;
  reg [3:0]  clock; //Packed struct in port of clock input
  reg a,b; wire s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always begin #5 a=clock[1];b=clock[0]; end
  initial $monitor($time, " a = %b,%b, b = %b,%b,out carry = %b, outsum = %b ",clock[3:2],clock[1:0],a,b,ca,s);
  initial #30 $stop;
endmodule
### Expected Results:
Test should result in a signal routing test error.
### Relevant Coding