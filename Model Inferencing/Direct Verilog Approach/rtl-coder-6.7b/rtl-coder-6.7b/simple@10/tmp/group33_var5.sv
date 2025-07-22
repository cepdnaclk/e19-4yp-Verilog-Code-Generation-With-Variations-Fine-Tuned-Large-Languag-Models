// The parameter values are packed in the structure
typedef struct packed {
  int d1,
  int d2;
} del_t;
module ha_1(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(del.d1,del.d2) (s,a,b);
  and #(del.d1,del.d2) (ca,a,b);
endmodule
### Top Module Using Variation Instruction:
module top();
  // Local Variables
  del_t delay_value;
  // Instantiate a Half Adder
  ha_1 HA1(
   .s(s),
   .ca(ca),
   .a(a),
   .b(b));
  // Set up the parameters
  initial delay_value.d1 = 1;
  delay_value.d2 = 2;
  // Assign the parameter values
  $set_gate_delay(HA1,delay_value);
endmodule
### Example Simulation:
a  b  s  ca
0  0  0  0
0  1  1  0
1  0  1  0
1  1  0  1
```