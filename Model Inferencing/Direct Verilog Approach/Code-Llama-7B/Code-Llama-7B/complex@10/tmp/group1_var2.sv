module tst_nor3NMOS();
  parameter NUM_INPUTS = 3; // Added or changed
  reg in1,in2,in3; wire b;
  generate
    genvar i; // Added
    for (i = 0; i < NUM_INPUTS; i = i + 1) begin : \gen_block1 // Added or changed
      nor3NMOS nor_block (in1, in2, in3, b); // Instantiate NMOS NOR
    end
  endgenerate
  // Initialize inputs
  initial begin  // Added
    in1 = 1'b0;
    in2 = 1'b0;
    in3 = 1'b0; // Corrected: was 1'b1
  end
  // Toggle inputs at different rates
  always #2 in1 = ~in1;
  always #3 in2 = ~in2;
  always #5 in3 = ~in3;
  // Removed newlines // Unchanged
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b); // Removed newline
  initial #24 $stop; // Stop simulation
endmodule