module tstha_9();
  reg a,b; wire s,ca;
  ha_9_packed_struct hh(s,ca,a,b);
  initial begin a=0;b=0; end
  always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b, out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
endmodule
### Expected Result:
Test Passed
### Actual Result:
Test Failed
### Compilation Logs:
```
-------------------------
File       : tstha_9.v
Line       : 7
Description: Instance 'hh' of entity 'ha_9' is missing port mapping for port 'clka'.
              ** Error: (vlog-2117) $unit: "tstha_9": $fatal: "tstha_9.v, 7": instance 'hh': Instance of entity 'ha_9' is missing port mapping for port 'clka'.
-------------------------
File       : tstha_9.v
Line       : 7
Description: Instance 'hh' of entity 'ha_9' is missing port mapping for port 'clkb'.
              ** Error: (vlog-2117) $unit: "tstha_9": $fatal: "tstha_9.v, 7": instance 'hh': Instance of entity 'ha_9' is missing port mapping for port 'clkb'.
-------------------------
File       : tstha_9.v
Line       : 7
Description: Instance 'hh' of entity 'ha_9' is missing port mapping for port 'a'.
              ** Error: (vlog-2117) $unit: "tstha_9": $fatal: "tstha_9.v, 7": instance 'hh': Instance of entity 'ha_9' is missing port mapping for port 'a'.
-------------------------
File