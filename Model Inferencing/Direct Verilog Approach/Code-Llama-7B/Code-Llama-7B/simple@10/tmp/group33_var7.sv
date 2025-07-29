module adder(s,ca,c,a,b); // Full Adder with gate delays
  input a,b,c; output s,ca,c;
  ha_1 sum(s,ca,a,b);
  and #(3,4) (c,a,b);
  or #(5,6) (c,a,b);
endmodule
module adder(s,ca,c,a,b); // Full Adder with gate delays
  input a,b,c; output s,ca,c;
  ha_1 sum(s,ca,a,b);
  and #(3,4) (c,a,b);
  or #(5,6) (c,a,b);
endmodule

### Base Verilog Code:
module rca_1(o,s,a,b); // Ripple Carry Adder with gate delays
  input a[0:6],b[0:6]; output o[0:7]; wire carry[0:6];
  ad