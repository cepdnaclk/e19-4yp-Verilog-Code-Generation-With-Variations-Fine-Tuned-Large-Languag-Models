`include "consts.sv"
module ha_2(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor h (s,a,b);
  and g (ca,a,b);
  gate_delays h_delays = h.gate_delays;
  gate_delays g_delays = g.gate_delays;
  assign h_delays.in_p = consts.in_p;
  assign h_delays.in_n = consts.in_n;
  assign h_delays.out_p = consts.out_p;
  assign h_delays.out_n = consts.out_n;
  assign g_delays.in_p = consts.in_p;
  assign g_delays.in_n = consts.in_n;
  assign g_delays.out_p = consts.out_p;
  assign g_delays.out_n = consts.out_n;
endmodule