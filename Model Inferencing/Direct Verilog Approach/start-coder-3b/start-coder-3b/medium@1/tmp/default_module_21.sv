module tst_nm_in_out_clk_clk_pol();
  reg in; reg out; reg clk; wire clk_pol1; wire clk_pol2;
  NMOSinv nmv(out,in, clk); // Instantiate NMOS inverter
  initial
    in =1'b1; //