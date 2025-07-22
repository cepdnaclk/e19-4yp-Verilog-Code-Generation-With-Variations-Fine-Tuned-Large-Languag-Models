module ha_6(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(delay.delay) (s,a,b);
  and #(delay.delay) (ca,a,b);
endmodule