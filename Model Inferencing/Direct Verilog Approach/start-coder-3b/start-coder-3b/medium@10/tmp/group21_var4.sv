module tst_pm_out();
  reg out; wire in;
  PMOSinv pmv(out,in); // Instantiate PMOS inverter
  initial
    out =1'b1; // Start with output high -> input low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation

  initial $monitor($time, " in = %b, output = %b ",in,out);
endmodule
### Simulation Results:
![PMOSinv Array Version](./images/Tst_Pm_Out_Array.PNG)

<br/>

## Tst_pm_out_in
### Base Verilog Code:
module tst_pm_out_in();
  reg out,in;
  PMOS