module ha_1(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(1,2) (s,a,b);
  and #(3,4) (ca,a,b);
endmodule
module ha_3 #(
  parameter real delay_xor = -1,
  parameter real delay_and = -1
) (
  output reg s,
  output reg ca,
  input a,b
);

  always @(a,b) #delay_and ca = a & b;
  always @(a,b) #delay_xor s = a ^ b;
endmodule

module toplev();
  wire a,b;
  wire s,ca;
  ha_3 #(delay_xor=0, delay_and=0) aha (s,ca,a,b);
endmodule

#### Explanation:
The parameter values are declared as real values. This is because the delay