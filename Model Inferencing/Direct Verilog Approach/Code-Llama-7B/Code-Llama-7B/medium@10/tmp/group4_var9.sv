module jk(clk, clr, in, out); // JK flipflop
  input clk, clr;
  input in;
  output out;
  wire n1, n2; // n1 and n2 are two inputs to nor3NMOS
  // nor3NMOS instantiation
  nor3NMOS (n1, in, clk, out);
  nor3NMOS (n2, clr, clk, out);
endmodule
### Testbench Code:
module jk_TB;
  wire clr, clk, out;
  // clk: 50 MHz, clr: 1 MHz
  initial begin
    clr = 1'b1;
    clk = 1'b0;
    #(1000000000/2); // T
    clr = 1'b0;
    #(1000000/2); // T
    clk = 1'b1;
    #(1000000/2); // T
    clr = 1'b1;
    #(1000000/2); // T
    clr = 1'b0;
    #(1000000/2); // T
    clk = 1'b0;
    #(1000000/2); // T
    clk = 1'b1;
    #(1000000/2); // T
  end
  jk ff (clk, clr, 1'b1, out);
  initial begin
    $monitor("out = %d", out);
    $monitor("clk = %d", clk