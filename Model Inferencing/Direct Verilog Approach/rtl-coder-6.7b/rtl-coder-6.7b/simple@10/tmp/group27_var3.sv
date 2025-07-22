module tstha_9();
  reg clk;
  struct packed {bit  a,b ;} i;
  struct packed {bit  s,ca; } o;
  ha_9 hh(o.s,o.ca,i.a,i.b); // Instantiate HA with rise/fall path delays
  initial begin i.a=0;i.b=0; end
  always begin #5 i.a=1;i.b=0; #5 i.a=0;i.b=1; #5 i.a=1;i.b=1; #5 i.a=0;i.b=0; end
  initial $monitor($time, " i.a = %b, i.b = %b,out.ca = %b, out.s = %b ",i.a,i.b,o.ca,o.s);
  initial #30 $stop;
endmodule
### Testbench :
module tb_ha_9();
  reg a,b; reg clk;
  wire s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays

  initial begin a=0;b=0; end
  initial #5 $display ("  t=5 @t=%0t a=%b b=%b s=%b ca=%b",$time,a,b,s,ca);
  initial #10 $display (" t=10 @t=%0t a=%b b=%b s=%b ca=%b",$time,a,b,s,ca);
  initial #15 $display (" t=15 @t=%0t a=%b b=%b s=%b ca=%b",$time,a,b,s,ca);
  initial #20 $display (" t=20 @t=%0t a=%b b=%b s=%b ca=%b",$time,a,b,s,ca);
  initial #25 $display (" t=25 @t=%0t a=%b b=%b s=%