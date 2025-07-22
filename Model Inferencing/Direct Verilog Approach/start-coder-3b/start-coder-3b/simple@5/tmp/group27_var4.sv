module tstha_7();
  reg a,b,c,clk;
  ha_7 hh(a,b,c,c_inv); // Instantiate HA with rise/fall path delays
  initial begin
    #5 clk=1;
    #5 a=1;b=1;
    #5 clk=1;
    #5 c=1;
    #5 c_inv = 1;
    #5 c=0;
    #5 a=0;
    #5 b=0;
    #5 clk=0;
  end
  initial $monitor($time, " a = %b, b = %b,out carry = %b ",a,b,c);
  initial #30 $stop;
endmodule
##### Base Verilog Code:
module tstha_7();
  reg a,b,c,clk;
  ha_7 hh(a,b,c,c_inv); // Instantiate HA with rise/fall path delays
  initial begin
    #5 clk=1;
    #5 a=1;b=1;
    #5 clk=