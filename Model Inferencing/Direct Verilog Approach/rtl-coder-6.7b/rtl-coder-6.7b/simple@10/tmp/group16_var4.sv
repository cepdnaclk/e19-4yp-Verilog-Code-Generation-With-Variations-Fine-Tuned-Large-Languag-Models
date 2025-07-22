module orfr_tst;
  typedef struct {
    logic DataOut;
    string DataIn;
  } data;
  data d;
  initial begin d.DataIn = "00"; d.DataOut = 0; #20 $stop; end
  always #3 d.DataIn = "01";
  or_fr_rl dd(d.DataOut,d.DataIn);
endmodule