module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  function [2:0] c;
    c[0] = di;
    c[1] = clk;
    c[2] = do;
    return c;
  endfunction
  initial $display ("d1.do.c()=%b",c());
endmodule
### Simulation Output:
./tst_dff_p_b.v:20: Function 'c' returns '1' bits, 
./tst_dff_p_b.v:41: Function 'c' returns '1' bits
./tst_dff_p_b.v: Top-level testbench module
./tst_dff_p_b.v:17: time 0, clk=0, di=0, do=0
./tst_dff_p_b.v:17: time 3, clk=1, di=1, do=0
./tst_dff_p_b.v:17: time 6, clk=0, di=1, do=1
./tst_dff_p_b.v:17: time 9, clk=1, di=0, do=1
./tst_dff_p_b.v:17: time 12, clk=0, di=0, do=0
./tst_dff_p_b.v:17: time 15, clk=1, di=1, do=0
./tst_dff