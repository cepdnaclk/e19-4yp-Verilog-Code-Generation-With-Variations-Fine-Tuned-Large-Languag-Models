```
module ha_10 (clk_3,rst_3, a, b, c, s, ca);
  reg s;
  reg ca;
  always @(posedge clk_3|negedge rst_3) begin
    if (rst_3) begin
      s <= 1'b1;
      ca <= 1'b1;
    end
    else begin
      s <= a ^ b;
      ca <= (a & b) | (a ^ b);
    end
  end
endmodule
module tstha_10();
  reg a,b;
  reg c;
  wire s,ca;
  ha_10 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
endmodule
```
### Output
![alt_text](test14.png "The Verilog Module")
![alt_text](test15.png "The Schematic Module")
![alt_text](test16.png "The GDS Module")
![alt_text](test17.png "The GDS Module")
![alt_text](test18.png "The GDS Module")
![alt_text](test19.png "The GDS Module")

### Results:
```
a = %b, b = %b,out carry = %b, outsum = %b 
0 0 0 0 
0 0 0 1 
0 1 1 0 
0 1 1 1 
1 0 1 0 
1 0 1 1 
1 1 0 0 
1 1 0 1 
1 1 1 0 
1 1 1 1 
0 0 0 0 
0 0 0 1 
0 1 0 0 
0 1 0 1 
0 1 1 1 
0 1 1 0 
1 0 0 0 
1 0 0 1 
1 0 1 1 
1 0 1 0 
1 1 0 1 
1 1 0 0 
1 1 1 1 
1 1 1 0 
1 1 1 1 
1 1 1 0 
0 0 0 0 
0 0 0 1 
0 1 1 1 
0 1 1 0 
1 0 0 1 
1 0 0 0 
1 0 1 0 
1 0 1 1 
1 1 0 1 
1 1 0 0 
1 1 1 1 
1 1 1 0 
1 1 1 1 
1 1 1 0 
0 0 0 0 
0