module tst_nm_in(inout in, out);
  reg in, out;
  NMOSinv nm(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  -- if in = 1, output = 0
  -- if in = 0, output = 1
  if (in = 1)
    out = 1'b0;
  else if (in = 0)
    out = 1'b1;
  end
  initial #15 $stop; // Stop simulation
endmodule

## Design Analysis:
### Modified Design Analysis:
#### Schematic:
Below is a schematic of the modified design with all of the components from the original design.
![