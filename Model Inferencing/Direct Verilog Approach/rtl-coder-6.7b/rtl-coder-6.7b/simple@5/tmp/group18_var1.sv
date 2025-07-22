module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ao, ai;
  enum logic [1:0] {ZERO,ONE} ao, ai;
  not #2 (ao,ai);
endmodule