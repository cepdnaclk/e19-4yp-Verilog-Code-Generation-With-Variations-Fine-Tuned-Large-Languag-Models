module tstha_1();
  packed struct {
    wire a;
    wire b;
  } regdata;
  wire s,ca;
  ha_1 hh(s,ca,regdata);
endmodule


## Test Module: tstha_0
### Base Verilog Code:
module tstha_0();
  reg a,b; wire s,ca;
  ha_0 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end