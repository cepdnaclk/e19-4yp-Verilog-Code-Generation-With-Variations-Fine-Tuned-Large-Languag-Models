module show_ac(ao,ai); // AND gate
  output ao; input ai; wire ao, ai;
  typedef enum {a=0,b=4,c=8} x;
  x a, b; //a,b are enums
  x c = c; //c is default value of c
  and #2 (ao,ai);
endmodule
### Original Code:
module show_ad(ao,ai,bi); // A and B should be ignored
  output ao; input ai, bi; wire ao, ai, bi;
  and #2 (ao,ai);
endmodule
### Variation Instruction:
Change A and B from logic to packed enums