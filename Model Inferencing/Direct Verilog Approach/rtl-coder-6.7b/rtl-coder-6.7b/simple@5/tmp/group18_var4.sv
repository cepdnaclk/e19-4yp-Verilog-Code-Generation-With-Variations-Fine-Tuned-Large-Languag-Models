module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ao; input logic [1:0] ai;
  not #2 (ao,ai[0]);
endmodule