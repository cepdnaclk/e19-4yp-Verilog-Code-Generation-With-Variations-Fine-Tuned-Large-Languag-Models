module ha_1(s,ca,a,b);  // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(delay_struct.xor_delay) (s,a,b);
  and #(delay_struct.and_delay) (ca,a,b);
endmodule