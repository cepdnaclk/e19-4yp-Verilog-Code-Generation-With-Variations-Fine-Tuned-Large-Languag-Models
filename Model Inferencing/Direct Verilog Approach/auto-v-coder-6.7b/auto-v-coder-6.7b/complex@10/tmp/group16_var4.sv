```verilog
package comp_pkg;
  parameter int ADDR_LOOKUP_TABLE[3] = '{2, 4, 6};
endpackage

module TOP1(
  input logic CLK,
  input logic RST_X,
  input logic [3:0] x,
  output logic result
);
  import comp_pkg::*;

  always_comb begin
    result = 0;
    for (int ii = 0; ii < 3; ii++) begin
      if (x == ADDR_