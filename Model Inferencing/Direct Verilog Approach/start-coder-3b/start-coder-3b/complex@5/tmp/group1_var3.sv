module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS NOR
  generate
    always #2 in1=~in1;
    always #3 in2=~in2;
    always #5 in3=~in3;
  endgenerate
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b); // Removed newline
  initial #24 $stop; // Stop simulation
endmodule
### Result:
![](https://raw.githubusercontent.com/nandoabreu/pic_trans/master/pic_verilog/testbench_nor3_NMOS.png)
### Modified Verilog Code:
module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS NOR
  initial begin // Initialize inputs
    in1=1'b0; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
  end
  // Toggle inputs at different rates
  initial begin
    start_time: begin  // Generate the toggles (comment this line to use the same toggles for different modules)
      genvar i;
      generate
        for (i = 1; i <= 32; i = i + 4) begin
          // Toggle the inputs, at different rates
          assign in1 = i == 1? ~in1 : in1;
          assign in2 = i == 4? ~in2 : in2;
          assign in3 = i == 8? ~in3 : in3;
        end
      endgenerate
    end : stop_time; // Stop the simulation
  end
endmodule
### Result:
![](https://raw.githubusercontent.com/nandoabreu/pic_trans/master/pic_verilog/testbench_nor3_NMOS_gen.png)
[comment]: <> (https://github.com/nandoabreu/pic_trans/blob/master/pic_verilog/testbench_nor3_NMOS_gen.png)
### Discussion:
The first image shows the modified behavioral NOR gate. The second image shows the same behavioral NOR gate, but with a different set of toggles. As we can see, the second image has a different set of toggles, which makes the testbench the same. The problem is that the same set of toggles is being used across different modules. This is a bad practice and should never be done. The correct way to do this is to generate the toggles inside the testbench.
/pic_verilog/testbench_nor3_NMOS_gen.md
## Testbench Behavioral NOR Gate with 3 NMOS inputs and one NMOS output

## Base Verilog Code:
```
module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS NOR
  initial begin // Initialize inputs
    in1=1'b0; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
  end
  // Toggle inputs at different rates
  always #2 in1=~in1;
  always #3 in2=~in2;
  always #5 in3=~in3;
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b); // Removed newline
  initial #24 $stop; // Stop simulation
endmodule
```
## Variation Instruction:
Insert a `generate` block with an escaped name (e.g., \gen_block1 ) and use `inside` operator with constant index in a behavioral NOR gate.
## Modified Code:
```
module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS NOR
  generate
    always #2 in1=~in1;
    always #3 in2=~in2;
    always #5 in3=~in3;
  endgenerate
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b); // Removed newline
  initial #24 $stop; // Stop simulation
endmodule
```
# Modified Verilog Code:
```
module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS NOR
  initial begin // Initialize inputs
    in1=1'b0; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
  end
  // Toggle inputs at different rates
  initial begin
    start_time: begin  // Generate the toggles (comment this line to use the same toggles for different modules)
      genvar i;
      generate
        for (i = 1; i <= 32; i = i + 4) begin
          // Toggle the inputs, at different rates
          assign in1 = i == 1? ~in1 : in1;
          assign in2 = i == 4? ~in2 : in2;
          assign in3 = i == 8? ~in3 : in3;
        end
      endgenerate
    end : stop_time; // Stop the simulation
  end
endmodule
```
# Result:
<img src="https://raw.githubusercontent.com/nandoabreu/pic_trans/master/pic_verilog/testbench_nor3_NMOS.png"/>
<img src="https://raw.githubusercontent.com/nandoabreu/pic_trans/master/pic_verilog/testbench_nor3_NMOS_gen.png"/>
# Discussion:
The first image shows the modified behavioral NOR gate. The second image shows the same behavioral NOR gate, but with a different set of toggles. As we can see, the second image has a different set of toggles, which makes the testbench the same. The problem is that the same set of toggles is being used across different modules. This is a bad practice and should never be done. The correct way to do this is to generate the toggles inside the testbench.

This method works for any number of inputs, the only thing that changes is the number of inputs in the initial code and the number of inputs in the generate block.

<img src="pic_verilog/generate_genvar_for_3_inputs.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_2.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_3.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_4.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_5.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_6.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_7.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_8.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_9.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_10.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_11.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_12.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_13.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_14.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_15.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_16.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_17.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_18.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_19.png"/>
<img src="pic_verilog/generate_genvar_for_3_inputs_20.png"/>
<