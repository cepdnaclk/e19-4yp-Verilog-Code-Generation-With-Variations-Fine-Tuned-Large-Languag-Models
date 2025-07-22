module ha_2(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(`PARAM,`PARAM) (s,a,b);
  and #(`PARAM,`PARAM) (ca,a,b);
endmodule