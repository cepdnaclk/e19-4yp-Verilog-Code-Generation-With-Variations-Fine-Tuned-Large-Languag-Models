module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  genvar i;
  generate
    for (i = 0; i < 3; i = i + 1)
      begin : gen_block1
        norNor3 nn(in1,in2,in3,bb[i]);
      end
  endgenerate
  initial begin // Initialize inputs
    in1=1'b1; in2=1'b1; in3=1'b1; // Corrected: was 1'b0
  end
  // Toggle inputs at different rates
  always #2 in1=~in1;
  always #3 in2=~in2;
  always #5 in3=~in3;
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b); // Removed newline
  initial #24 $stop; // Stop simulation
endmodule

## [Task #65](https://github.com/hdlworks/ExCAD/blob/main/TestBenches/tst_nor3NMOS.sv) - Verify with a testbench

1. Read the base Verilog code in code tab above and run the testbench (which is included in the testbench code tab)

2. Add the **generate** instruction and write the code inside the generate block. 

3. After you finish, run the testbench again.