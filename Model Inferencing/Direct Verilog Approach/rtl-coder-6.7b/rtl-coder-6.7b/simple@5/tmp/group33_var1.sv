module ha_1(s,ca,a,b);
  input a,b; output s,ca;
  localparam struct {int delay[2:0]} delays = '{1,2,3,4};
  xor #(delays.delay[0]) (s,a,b);
  and #(delays.delay[1]) (ca,a,b);
endmodule