module ha_1(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(1,2) (s,a,b);
  and #(3,4) (ca,a,b);
endmodule
module ha #(struct t,i,j) (s,ca,a,b); // Half Adder with gate delays
  input