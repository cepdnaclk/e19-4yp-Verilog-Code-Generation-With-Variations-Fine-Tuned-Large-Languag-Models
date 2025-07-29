module t_Clock_Prog ();
  wire clock;

  initial #100 $finish;
  Clock_Prog M1 ();
endmodule
### Variation Instruction:
Add two instances of the