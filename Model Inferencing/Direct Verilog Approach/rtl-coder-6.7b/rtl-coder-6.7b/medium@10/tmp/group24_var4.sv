module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk);
  initial begin 
    clk=0; di=1'b0; #35 $stop;
    int i;
    $display("%m: Top-level testbench module");
    i = $display("di=%b",di);
    $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
    i = ~i;
  end 
  always #3