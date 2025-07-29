module show_ab(ao,ai,bi); // OR gate with delay 1
  parameter [3:0] a=1;
  parameter [3:0] b=2;
  output ao; input ai, bi; wire ao, ai, bi;
  or #1 (ao,ai,bi) ;
endmodule
### Unmodified Code:
module show_ab(ao,ai,bi); // OR gate with delay 1
  output ao; input ai, bi; wire ao, ai, bi;
  or #1 (ao,ai,bi);
endmodule
### Parameters:
* a: enum value, default value 1
* b: enum value, non-default value 2
### Generated