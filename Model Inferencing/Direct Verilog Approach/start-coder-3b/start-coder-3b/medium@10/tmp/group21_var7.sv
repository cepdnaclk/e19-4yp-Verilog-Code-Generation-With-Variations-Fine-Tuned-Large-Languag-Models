module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
    case(in)
      1'b1: out = 1'b1;
      else: out = 1'b0;
    endcase
  forever
    initial in =1'b1; // Start with input high -> output low
    always
      case(in)
        1'b1: out = 1'b1;
        else: out = 1'b0;
      endcase
    #15 $stop; // Stop simulation
  initial #15 $stop; // Stop simulation
endmodule
### Analysis of the result:
The output of the simulation is as follows:
```
Time 225, in = 1, output = 1
Time 226, in = 0, output = 0
Time 227, in = 1, output = 1
Time 228, in = 0, output = 0
Time 229, in = 1, output = 1
Time 230, in = 0, output = 0
Time 231, in = 1, output = 1
Time 232, in