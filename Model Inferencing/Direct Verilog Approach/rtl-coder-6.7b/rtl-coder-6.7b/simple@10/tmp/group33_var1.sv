struct {int s,int c;} Delays;
module ha_2(s,ca,a,b,delays);
  input a,b; output s,ca; Delays delays;
  xor #(delays.s,delays.c) (s,a,b);
  and #(delays.s,delays.c) (ca,a,b);
endmodule
### Testbench Code:
module test;
  Delays delays;
  delays.s = 3; delays.c = 4;
  ha_2 #(delays) u1(s,ca,a,b);
endmodule