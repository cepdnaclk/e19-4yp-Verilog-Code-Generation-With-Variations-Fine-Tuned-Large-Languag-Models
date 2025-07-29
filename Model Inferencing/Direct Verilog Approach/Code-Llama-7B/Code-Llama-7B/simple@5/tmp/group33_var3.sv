module ha_2(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(1,2) (s,a,b);
  and #(3,4) (ca,a,b);
endmodule

module xor #(parameter delay_a = 1, parameter delay_b = 2) (output x, input a, b);
  always @(a or b) #delay_a x = a ^ b;
endmodule
module and #(parameter delay_a = 3, parameter delay_b = 4) (output x, input a, b);
  always @(a or b) #delay_a x = a & b;
endmodule

module test;
  timeunit 1ns; timeprecision 1ns;
  wire w,x,y,z;
  ha_1 h1 (y,z,x,w);
  structure #(2) ha_param_struct;
    ha_param_struct.x_in1 = 1;
    ha_param_struct.x_in2 = 2;
    ha_param_struct.x_out = 3;
    ha_param_struct.x_ca_out = 4;
  structure #(2) v_ha_param_struct = ha_param_struct;
  ha_2 ha2_mod (y,z,x,w);
  structure #(2) v_ha_param_struct = ha_param_struct;
  ha_2 ha2_mod (y,z,x,w);
  structure #(2) v_ha_param_struct = ha_param_struct;
  ha