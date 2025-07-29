* Added `XMR_XMR_index.sv`
  ```verilog
  module XMR_XMR_index (
      input logic [1:0] BCD_in,
      input logic clk,
      input logic [3:0] index,
      output logic [3:0] result
       );
  // Modified code...
  assign result = pkg::consts[BCD_in];
  ```
* Updated `test_mod.sv`
  ```verilog
  reg [1:0] BCD_in; // BCD input
  //...
  initial begin
      //...
      BCD_in = 2'b00;
      #