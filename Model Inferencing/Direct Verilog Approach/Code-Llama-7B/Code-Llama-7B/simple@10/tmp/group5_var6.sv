module tst_dff_pbeh();
  logic di,clk; wire do; // Change reg declarations to logic
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Error Message:
ERROR: [VRFC 10-393] Verilog-2005 does not support "logic".
      (tst_dff_pbeh.sv,2)
    1  module tst_dff_pbeh();
    2    logic di,clk; wire do; // Change reg declarations to logic
    3    dff_p d1(do,di,clk); // Instantiate DFF with path delay
    4    initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
    5    always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
tst_dff_pbeh.sv, line 2. Use -sv_extended if you want to support SystemVerilog
    6    always #5 di=~di; // Toggle data
    7    initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
    8  endmodule
      (tst_dff_pbeh.sv,3)
    1  module tst_dff_pbeh();
    2    logic di,clk; wire do; // Change reg declarations to logic
    3    dff_p d1(do,di,clk); // Instantiate DFF with path delay
    4    initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop