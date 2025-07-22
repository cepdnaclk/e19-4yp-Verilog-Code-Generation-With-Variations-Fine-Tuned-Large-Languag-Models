module tstha_7();
  reg a,b; wire s,ca;
  packed ha_7 hh(s,ca,a,b,clk); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #50 $stop;
endmodule
### Result:
$./tb_tstha_7 < a=0,b=0,clk=0 > a=0,b=0,out carry=1,outsum=0
$./tb_tstha_7 < a=0,b=1,clk=0 > a=0,b=1,out carry=0,outsum=1
$./tb_tstha_7 < a=1,b=0,clk=0 > a=1,b=0,out carry=0,outsum=1
$./tb_tstha_7 < a=1,b=1,clk=0 > a=1,b=1,out carry=1,outsum=0
$./tb_tstha_7 < a=0,b=0,clk=1 > a=0,b=0,out carry=1,outsum=0
$./tb_tstha_7 < a=0,b=1,clk=1 > a=0,b=1,out carry=0,outsum=1
$./tb_tstha_7 < a=1,b=0,clk=1 > a=1,b=0,out carry=0,outsum=1
$./tb_tstha_7 < a=1,b=1,clk=1 > a=1,b=1,out carry=1,outsum=0
### See Also:
<a href