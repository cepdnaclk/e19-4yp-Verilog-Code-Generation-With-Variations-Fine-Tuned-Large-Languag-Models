module tst_pm_nor2_inv();
  wire in1, in2; reg out;
  Pass1Nor2Inv nmv(out,in1,in2); // Instantiate NMOS inverter
  initial
    in1 =1'b1; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  always #15 $stop; // Stop simulation
endmodule

### Base Verilog Code:
module tst_pm_nor2();
  wire in1, in2; reg out;
  Pass1Nor2 nmv(out,in1,in2); // Instantiate NMOS inverter
  initial
    in1 =1'b1; // Start with input high -> output low
  always
  initial $monitor($time