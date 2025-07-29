module ha_2(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  parameter struct {
    int s,ca;
  } dly = '{ 1:1, 3:2 };
  xor #(dly.s,dly.ca) (s,a,b);
  and #(dly.ca,dly.s) (ca,a,b);
endmodule
### Modified