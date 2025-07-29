module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule
### Compare Sources:
#### Code:
module show_a(ao,ai,bi); // AND gate with delay 1
  output ao; input ai,bi; wire ao, ai, bi;
  and #1 (ao,ai,bi);
endmodule
#### Code:
module show_a(ao,ai,bi); // AND gate with delay 1
  output ao; input ai,bi; wire ao, ai, bi;
  and #1 (ao,ai,bi);
endmodule
### Compare Sources:
#### Code:
module show_a(ao,ai,bi); // AND gate with delay 1
  output ao; input ai,bi; wire ao, ai, bi;
  and #1 (ao,ai,bi);
endmodule
#### Code:
module show_a(ao,ai,bi); // AND gate with delay 1
  output ao; input ai,bi; wire ao, ai, bi;
  and #1 (ao,ai,bi);
endmodule
### Compare Sources:
#### Code:
module show_b(ao,ai,bi); // OR gate with delay 2
  output ao; input ai,bi; wire ao, ai, bi;
  or #2 (ao,ai,bi);
endmodule
#### Code:
module show_b(ao,ai,bi); // OR gate with delay 2
  output ao, ao, ao, ao; input ai,bi; wire ai, bi;
  or #2 (ao,ai,bi);
endmodule
### Compare Sources:
#### Code:
module show_b(ao,ai,bi); // OR gate with delay 2
  output ao, ao, ao, ao; input ai,bi; wire ai, bi;
  or #2 (ao,ai,bi);
endmodule
#### Code:
module show_b(ao,ai,bi); // OR gate with delay 2
  output ao, ao, ao, ao; input ai,bi; wire ai, bi;