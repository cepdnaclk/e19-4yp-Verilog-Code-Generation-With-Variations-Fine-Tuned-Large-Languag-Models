module show_aa(ao,ai); // NOT gate with delay 2
  output ao;
  input ai;
  enum {A=1,B=5} ai;
  logic [$clog2(2)-:0] ao;
  assign ao={~ai};
endmodule