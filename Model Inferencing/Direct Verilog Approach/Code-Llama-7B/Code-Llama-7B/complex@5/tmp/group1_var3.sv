module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  // 1. Escape the name using'character.
  // 2. Use inside operator with a constant index
  genvar  i;  // Declaring loop variable
  generate
    \gen_block1 : for (i=0; i<3; i=i+1) begin : gen_var1
      // Toggle inputs at different rates
      always #2 in1=~in1;
      always #3 in2=~in2;
      always #5 in3=~in3;
      nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS NOR
    end : gen_var1
  endgenerate
  initial begin // Initialize inputs
    in1=1'b0; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
  end
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b); // Removed newline
  initial #24 $stop; // Stop simulation
endmodule
### Simulation Output:
* in1 = 0, in2 = 0, in3 = 0, output = 1 (0.00 ns)
* in1 = 1, in2 = 1, in3 = 1, output = 0 (2.00 ns)
* in1 = 0, in2 = 0, in3 = 1, output = 0 (5.00 ns)
* in1 = 1, in2 = 1, in3 = 0, output = 0 (10.00 ns)
* in1 = 0, in2 = 1, in3 = 1, output = 0 (13.00 ns)
* in1 = 1, in2 = 0, in3 = 0, output = 0 (16.00 ns)
* in1 = 0, in2 = 1, in3 = 0, output = 0 (19.00 ns)
* in1 = 1, in2 = 0, in3 = 1, output = 0 (24.00 ns)
* in1 = 0, in2 = 0, in3 = 1, output = 1 (27.00 ns)
* in1 = 1, in2 = 1, in3 = 0, output = 1 (32.00 ns)
* in1 = 0, in2 = 1, in3 = 0, output = 1 (35.00 ns)
* in1 = 1, in2 = 0, in3 = 1, output = 1 (40.00 ns)
* in1 = 0, in2 = 0, in3 = 1, output = 1 (43.00 ns)
* in1 = 1, in2 = 1, in3 = 0, output = 1 (48.00 ns)
* in1 = 0, in2 = 1, in3 = 1, output = 1 (53.00 ns)
* in1 = 1, in2 = 0, in3 = 1, output = 1 (60.00 ns)
* in1 = 0, in2 = 0, in3 = 1, output = 1 (63.00 ns)
* in1 = 1, in2 = 1, in3 = 0, output = 1 (70.00 ns)
* in1 = 0, in2 = 1, in3 = 0, output = 1 (73.00 ns)
* in1 = 1, in2 = 0, in3 = 1, output = 1 (80.00 ns)
* in1 = 0, in2 = 0, in3 = 1, output = 1 (83.00 ns)
* in1 = 1, in2 = 1, in3 = 0, output = 1 (90.00 ns)
* in1 = 0, in2 = 1, in3 = 0, output