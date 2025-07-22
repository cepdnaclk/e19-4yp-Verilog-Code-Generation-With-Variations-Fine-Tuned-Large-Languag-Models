```
module show_aa(o,i); // NOT gate with delay 2

  output o;
  input i;
  wire ai, ao;

  not #2 (i,o);

endmodule
```
## show_bb_a
### Base Verilog Code:
module show_bb(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ai,ao);
endmodule
### Variation Instruction:
Change A and B from logic to packed enums with default and non-default values to test enum-based