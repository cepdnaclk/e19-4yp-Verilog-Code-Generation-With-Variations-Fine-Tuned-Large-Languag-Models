```verilog
module tstha_9();
  parameter M = 4; //change the number of bits from 3 to 4
  reg a,b;
  wire [M-1:0] s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  
  initial begin
    a=0;
    b=0;
  end
  
  always begin
    #5 a=1;
    b=