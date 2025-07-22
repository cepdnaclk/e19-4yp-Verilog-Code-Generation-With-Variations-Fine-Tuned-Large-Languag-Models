module tst_dff_p_c();
  reg di,clk; wire do;
  dff_p d1(do,di,clk);
  initial begin clk=0; di=1'b0; #35 $stop; end
  always #3 clk=~clk;
  always #5 di=~di;
  initial begin $display ("%m: Top-level testbench module");
    $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
    $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  end
endmodule