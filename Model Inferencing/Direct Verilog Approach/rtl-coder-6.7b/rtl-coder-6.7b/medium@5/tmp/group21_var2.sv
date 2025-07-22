module tst_nm_out();
  reg clk;
  reg in;   wire out;
  NMOSinv nmv[0][1][0][1](out,in); // Instantiate NMOS inverter
  initial begin
    clk =1; // Start with clock high -> output low
    in   =1; // Start with input high -> output low
    #10 clk =0; #10 clk =1; #10 clk =0; #10 clk =1; #10 clk =0; #10 clk =1; #10 clk =0; #10 clk =1; #10 clk =0; #10 clk =1; #10 clk =0; #10 clk =1; #10 clk =0; #