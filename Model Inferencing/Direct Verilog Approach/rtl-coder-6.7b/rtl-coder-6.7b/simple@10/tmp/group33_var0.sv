module ha_1(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(gpi_params.xor_delay) (s,a,b);
  and #(gpi_params.and_delay) (ca,a,b);
endmodule