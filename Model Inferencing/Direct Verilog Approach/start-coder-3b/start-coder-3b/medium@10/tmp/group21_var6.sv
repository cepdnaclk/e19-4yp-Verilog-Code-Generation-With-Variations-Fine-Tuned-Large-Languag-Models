module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  parameter IN=1; parameter OUT=0;
  initial
    in =1'b1; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
    // For this example, use a case statement to index into a 4D array
    // The 4D array dimensions must be known to have the same value for every case statement
    // This is why the code below uses a function call which indexes into a 4D array
    // If the function call was changed to hardcode the array values, the compiler would reject the code
    // because the function would not be able to determine the dimensions of the array properly.
  always @(in)
    case (in) // This will allow the same code to be used for all cases, even if IN or OUT are changed
    1'b0: in = 1'b1; // Start with input high -> output low
    1'b1: in = 1'b0; // Start with input low -> output high
    default: in = 1'b 0; // This will trigger an error if any other case is not handled correctly
    endcase
endmodule
### Output:
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0
in = 0, output = 1
in = 1, output = 0

### Final Verilog Code:
module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  parameter IN=1; parameter OUT=0;
  initial
    in =1'b1; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
    // For this