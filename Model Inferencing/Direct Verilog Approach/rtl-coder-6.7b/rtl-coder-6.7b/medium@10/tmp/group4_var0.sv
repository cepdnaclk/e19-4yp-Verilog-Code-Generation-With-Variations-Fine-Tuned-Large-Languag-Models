module dffnand2(q, qbar, d, clk, clkbar, set, reset);
  output q, qbar;
  input d, clk, clkbar, set, reset;
  wire c, b;
  nand2 c1 (c,d,clk); // NAND gate in the data input
  nand2 c2 (b,clk,clk); // NAND gate in the clock input
  nand2 c3 (q,c,b); // NAND gate outputs to the outputs
  nand2 c4 (qbar,q,q); // NAND gate outputs to the outputs
  initial begin
    q <= 0; // Initial value of q
    qbar <= 1; // Initial value of qbar
  end
  always @ (posedge clk or posedge clkbar)
    if (set) q <= 1;
    else if (reset) q <= 0;
    else q <= c;
endmodule
### Base Verilog Code:
module not