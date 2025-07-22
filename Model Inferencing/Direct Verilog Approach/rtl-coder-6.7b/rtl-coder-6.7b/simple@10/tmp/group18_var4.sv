module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ao;
  enum {AA,BB} ai = BB;
  input ai;//enum {A,B} ai = B;
  not #2 (ao,ai);
endmodule
### Testing: