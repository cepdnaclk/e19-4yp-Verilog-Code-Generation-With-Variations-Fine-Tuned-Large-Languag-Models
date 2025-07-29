module nor(in1,in2,out);
  input in1,in2;
  output out;
  supply0 a; // Ground
  wire in1,in2,out;
  nand (out, in1, in2); // The original NAND gate
  pullup (out); // Pullup device on the output
endmodule
module nor3NMOS(in1,in2,in3,out);
  input in1,in2,in3;
  output out;
  supply0 a; // Ground
  wire out,b; // Output wire
  nmos (b, a, in1);
  nmos (b, a, in2);
  nmos (b, a, in3);
  nor(out, b, b); // The original NOR gate
  pullup (out); // Pullup device on the output
endmodule
module counter(clk,rst,q);
  input clk,rst;
  output [3:0] q;
  wire clk,rst,q;
  nand(rst, clk, rst); // The original NAND gate
  nor3NMOS(rst, rst, rst, clr);
  n