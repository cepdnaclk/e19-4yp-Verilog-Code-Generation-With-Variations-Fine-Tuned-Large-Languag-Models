```verilog
module tstha_14();
  reg a,b; wire s,ca;
  ha_14 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end