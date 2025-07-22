module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  reg [1:0][2:0][3:0][3:0] nmos_table;
  initial
    nmos_table[0][0][0]= not out;
    nmos_table[0][0][1]= not in;

    nmos_table[0][1][0]= not out;
    nmos_table[0][1][1]= in;

    nmos_table[1][0][0]= not out;
    nmos_table[1][0][1]= not in;

    nmos_table[1][1][0]= not out;
    nmos_table[1][1][1]= in;
  always
    case(in)
      1'b1: $monitor($time, " in = %b, output = %b ",in,out);
      1'b0: $monitor($time, " in = %b, output = %b ",in,out);
    endcase
  initial #15 $stop; // Stop simulation
endmodule
### Test:
The output shows that the behavior is the same as the base case statement, but this variation instruction allows us to see how the input affects the output.

![Alt text](images/nmos_variation.png)

### Base Verilog Code:
module tst_nm_in();
  wire in;