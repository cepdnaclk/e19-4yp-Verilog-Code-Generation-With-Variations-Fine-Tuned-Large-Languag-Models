module tstha_9();
  reg a,b; wire s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
  always #1 { a,b } = begin 
    #5 { 1'b0,1'b0}; // 00
    #5 { 1'b1,1'b0}; // 10
    #5 { 1'b0,1'b1}; // 01
    #5 { 1'