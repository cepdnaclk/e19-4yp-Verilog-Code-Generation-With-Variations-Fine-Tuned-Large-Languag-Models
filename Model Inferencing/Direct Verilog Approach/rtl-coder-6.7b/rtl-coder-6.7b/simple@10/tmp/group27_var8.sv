module tstha_9();
  typedef struct packed{
    bit a;
    bit b;
    bit c;
    bit d;
    bit e;
    bit f;
    bit g;
    bit h;
    bit i;
  } struct_t;
  logic [8:0] c;
  struct_t s;
  
  ha_9 hh(s.i,c[8],s.h,s.g);
  
  initial begin s='b100101001; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",s.h,s.g,c[8],s.i);
  initial #30 $stop;
endmodule
#### Result:
![image](https://user-images.githubusercontent.com/74046082/143700646-60d1d5c2-4129-4c20-a1a3-c3b4b54241a0.png)