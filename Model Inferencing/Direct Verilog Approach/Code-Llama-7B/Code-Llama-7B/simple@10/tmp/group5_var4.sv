module tst_dff_pbeh();
  logic [1:0] di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Simulation Result:
Notice that the data toggle is not visible in the output.
$ ghdl -r tst_dff_pbeh
ghdl -r tst_dff_pbeh
clk=0, di=x, do=0
clk=0, di=1, do=0
clk=1, di=1, do=1
clk=1, di=0, do=1
clk=0, di=0, do=0
clk=0, di=1, do=0
clk=1, di=1, do=1
clk=1, di=0, do=1
clk=0, di=0, do=0
clk=0, di=1, do=0
clk=1, di=1, do=1
clk=1, di=0, do=1
clk=0, di=0, do=0
clk=0, di=1, do=0
clk=1, di=1, do=1
clk=1, di=0, do=1
clk=0, di=0, do=0
clk=0, di=1, do=0
clk=1, di=1, do=1
clk=1, di=0, do=1
clk=0, di=0, do=0
clk=0, di=1, do=0
clk=1, di=1, do=1
clk=1, di=0, do=1
clk=0, di=0, do=0
clk=0, di=1, do