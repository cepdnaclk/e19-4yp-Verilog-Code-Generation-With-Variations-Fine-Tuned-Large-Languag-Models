module orfr_tst; // Testbench for OR gate with force/release
  typedef struct {logic v;string s;} data_t;
  data_t d1,d2;
  initial begin
    d1.v=1'b0;d1.s="0";
    d2.v=1'b1;d2.s="1";
    #20 $stop; end
  always #3 $stable($root.orfr_tst.d1);
  or_fr_rl dd(d2.v,d1.v,d2.s);
endmodule