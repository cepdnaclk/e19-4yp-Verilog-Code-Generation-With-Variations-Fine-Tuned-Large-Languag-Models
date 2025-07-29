module tst_dff_pbeh();
  logic di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Expected Result:
The test should compile and the output should be similar to the following.
$ vlog tst_dff.v tst_dff_pbeh.v +incdir+../source ;vvp tst_dff_pbeh.vvp
                    clk=1'b0, di=1'b0, do=1'b0
                    clk=1'b1, di=1'b0, do=1'b0
                    clk=1'b0, di=1'b1, do=1'b0
                    clk=1'b1, di=1'b1, do=1'b0
                    clk=1'b0, di=1'b0, do=1'b1
                    clk=1'b1, di=1'b0, do=1'b1
                    clk=1'b0, di=1'b1, do=1'b1
                    clk=1'b1, di=1'b1, do=1'b1
                    clk=1'b0, di=1'b0, do=1'b0
                    clk=1'b1, di=1'b0, do=1'b