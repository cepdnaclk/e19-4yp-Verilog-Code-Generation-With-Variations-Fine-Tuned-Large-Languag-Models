module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule
### Synthesized Code:
(* LOC=LOC, KEEP, DONT_TOUCH *)
(* FAMILY="FAMILY", MEM_INIT4={0,0,1,1,1,0,0}, MEM_INIT5={
  0,1,1,1,1,0,0} *)
module SHOW_AA_X0 (ao, ai);
  output ao;
  input ai;
  wire ao, ai;
  reg ao, ao0, ao1, ai;
  wire ao, ai;
  not #2 (ao0, ai);
  not #2 (ao1, ao0);
  not #2 (ao, ao1);
endmodule

module show_aa_1(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule

module show_aa_2(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule

module show_aa_3(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule

module show_aa_4(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule

module show_aa_5(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule

module show_aa_6(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule

module show_aa_7(ao,ai); // NOT gate with delay 2
  output