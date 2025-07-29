module tstha_9();
  reg [3:0] a, b; wire s,ca;
  //ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  reg [3:0] clk;
  initial begin a=0;b=0; clk = 4'b0001; end
  always begin #5 clk = clk + 1'b1; a=clk;b=clk; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
endmodule


### Base Verilog Code:
module tstha_10();
  reg a,b,c; wire s,ca;
  ha_10 hh(s,ca,a,b,c); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0;c=0;end
  initial begin 
    #20 $display("start %0d %0d %0d