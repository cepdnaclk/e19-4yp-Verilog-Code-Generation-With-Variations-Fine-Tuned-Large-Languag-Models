module tstha_11();
  reg a,b,c,d; wire s,ca;
  ha_11 hh(s,ca,a,b,c,d); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0;c=0;d=0; end
  initial begin
    struct packed_struct { reg a,b,c,d,e; } p;
    p.a = 0; p.b = 0; p.c = 0; p.d = 0; p.e = 1; 
    p.b = 1; #1 p.a = 2; #1 p.b = 0; #1 p.c = 0; #1 p.d = 0; #1 p.e = 0; #1 p.b = 1; #1 p.c = 0; #1 p.d = 0; #1 p.e = 1; #1 p.b = 0; #1 p.c = 0; #1 p.d = 0; #1 p.e = 1; #1 p.b = 1; #1 p.c = 0; #1 p.d = 1; #1 p.e = 0; #1 p.b = 0; #1 p.c = 0; #1 p.d = 1; #1 p.e = 1; #1 p.b = 1; #1 p.c = 1; #1 p.d = 0; #1 p.e = 0; #1 p.b = 0; #1 p.c = 0; #1 p.d = 1; #1 p.e = 0; #1 p.b = 1; 
  end
  initial $monitor($time, " a = %b, b = %b, c = %b, d = %b, out carry = %b, outsum = %b ",a,b,c,d,ca,s);
  initial #30 $stop;
endmodule
### Base Verilog Code:
module tstha_12();
  reg a,b,c,d,e; wire s,ca;
  ha_12 hh(s,ca,a,b,c,d,e); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0;c=0;d=0;e=0; end
  always begin #5 a=1;b=0;c=0;d=0;e=0; #5 a=0;b=1;c=0;d=0;e=0; #5 a=1;b=1;c=0;d=0