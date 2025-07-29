module jk(n,r,q,c); // 4 input JK flip-flop
  output r, q;
  input n,r,c;
  supply0 a,b; // Ground, supply
  wire r,q; // Outputs
  wire a,b; // Internal nodes
  nand (r, c, n, b); // Combinational process
  nand (q, n, r, b); // Combinational process
  nmos (a, b, n); // NMOS tristate
  nnor3NMOS(a,b,c,r); // 3-input NOR
  nand3 (a,b,c); // 3-input NAND
endmodule
### Variation Instruction:
Modify the jk instantiation to include a case statement and a 3-input NMOS NOR and a 3