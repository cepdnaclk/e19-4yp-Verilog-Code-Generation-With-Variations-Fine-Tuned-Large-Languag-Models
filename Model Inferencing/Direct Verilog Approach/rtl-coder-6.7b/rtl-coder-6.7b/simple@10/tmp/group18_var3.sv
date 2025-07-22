module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ao;
  parameter [1:0] B=0, A=1; input [1:0] ai;
  not #2 (ao,ai);
endmodule