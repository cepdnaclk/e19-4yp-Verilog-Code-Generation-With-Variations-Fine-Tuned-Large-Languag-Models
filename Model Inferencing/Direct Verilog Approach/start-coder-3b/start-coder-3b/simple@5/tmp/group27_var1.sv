module tstha_14();
  reg a,b; wire s,ca;
  ha_1 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  initial begin #10 $pack(a,b); a=0;b=0; end
  always begin #5 $pack(a,b); a=1;b=0; #5 $pack(a,b); a=0;b=1; #5 $pack(a,b); a=1;b=1; #5 $pack(a,b); a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
endmodule
### Simulation Results:
<img src='results/tstha_14_results.png' alt='Testbench Results' width=500>

### Conclusion
The testbench was constructed and successfully evaluated the following HAr modules:
* ha_4
* ha_5
* ha_6
* ha_7
* ha_8
* ha_9
* ha_10
* ha_11
* ha_12
* ha_13
* ha_14

This shows that the testbench successfully emulated all