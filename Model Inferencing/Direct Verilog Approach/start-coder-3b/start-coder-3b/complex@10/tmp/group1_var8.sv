module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS NOR
  initial begin // Initialize inputs
    in1=1'b0; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
  end
  generate
    gen_block1: for(int i=2;i<10;++i)
      #((2*i) in1=~in1);
      #((3*i) in2=~in2);
      #((5*i) in3=~in3);
    endgenerate
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b); // Removed newline
  initial #24 $stop; // Stop simulation
endmodule
### Before:
![Screenshot](https://github.com/abdelrahman-hisham/Vivado-VHDL-Template/blob/master/template_files/gen_block1_7.png)
### After:
![Screenshot](https://github.com/abdelrahman-hisham/Vivado-VHDL-Template/blob/master/template_files/gen_block1_8.png)

# # Generate Parallel for loops
### Base Verilog Code:
module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS NOR
  initial begin // Initialize inputs
    in1=1'b0; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
  end
  // Toggle inputs at different rates
  always #2 in1=~