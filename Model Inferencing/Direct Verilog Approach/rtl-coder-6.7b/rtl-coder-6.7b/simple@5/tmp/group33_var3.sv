module ha_1(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  wire a,b,s,ca;
  xor #(delay_s.s, delay_s.t) (s,a,b);
  and #(delay_ca.s,delay_ca.t) (ca,a,b);
endmodule

module delay_s(s,t);
  output reg s;
  output reg t;
  assign s = 1'b1;
  assign t = 1'b2;
endmodule

module delay_ca(s,t);
  output reg s;
  output reg t;
  assign s = 1'b3;
  assign t = 1'b4;
endmodule