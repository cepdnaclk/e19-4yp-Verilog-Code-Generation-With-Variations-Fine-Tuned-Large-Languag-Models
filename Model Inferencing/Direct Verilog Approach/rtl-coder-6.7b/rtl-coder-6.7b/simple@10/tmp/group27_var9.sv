module ha_9(sum, carry, a, b);
  input a, b;
  output [1:0]sum;
  output carry;
  wire s0,c0,s1,c1;
  ha ha1(s0, c0, a, b);
  assign c1 = c0 | s0;
  assign sum = {c1, s0};
endmodule