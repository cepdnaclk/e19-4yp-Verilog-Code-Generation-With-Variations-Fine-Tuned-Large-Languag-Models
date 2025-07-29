module tstha_16();
  (* KEEP = "TRUE" *) reg a,b; wire s,ca;
  reg [1:0] c; reg [3:0] d;
  ha_16 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  assign c = d[2:1];
  initial begin a=0;b=0; end
  always begin #5 a=1