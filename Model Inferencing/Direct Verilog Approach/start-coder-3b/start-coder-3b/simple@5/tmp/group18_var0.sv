module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai;
  wire [17:0] ao, ai;
  not #2 (ao,ai);
endmodule
### Base Verilog Code:
module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai;
  wire [17:0] ao, ai;
  not #2 (ao,ai);