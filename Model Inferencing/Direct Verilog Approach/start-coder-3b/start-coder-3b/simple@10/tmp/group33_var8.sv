```
module ha_3(a,s,ca,b); // Half Adder with gate delays
  input a,b; output s,ca;
  wire c,d,e,f,tmp_1,tmp_2;
  xor #(7,6) (c,a,b);
  and #(5,4) (s,b,e);
  xor #(3,2) (d,f,c);
  and #(7,6) (ca,f,tmp_1);
  and #(5,4) (s,tmp_1,d);
  or #(3,2) (tmp_2,e,tmp_1);
  and #(7,6) (ca,tmp_2,tmp_1);
  and #(5,4) (s,tmp_2,tmp_1);
endmodule
```


### Base Verilog Code:
module ha_3(a,s,ca,b); // Half Adder with gate delays
  input a,b; output s,ca;
  wire c,d,e,f,tmp_1,tmp_2;
  xor #(7,6) (c,a,b);
  and #(5,4) (s,b,e);
  xor #(3,2) (d,f,c);
  and #(7,6) (ca,f,tmp_1);
  and #(5,4) (s,tmp_1,d);
  or #(3,2) (tmp_2,e,tmp_1);
  and #(7,6) (ca,tmp_2