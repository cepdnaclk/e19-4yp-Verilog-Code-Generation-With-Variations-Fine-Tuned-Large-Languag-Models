module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai;
  packed bit B;
  B = 1'b0;
  A = 0;
  not #2 (B,ai);
endmodule
### Original Code:
module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai;
  packed bit B;
  B = 1'b0;
  A = 0;
  not #2 (B,ai);
endmodule

### Base Verilog Code:
module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule
### Variation Instruction:
Change A and B from logic to packed enums with default and non-default values to test enum-based inputs.