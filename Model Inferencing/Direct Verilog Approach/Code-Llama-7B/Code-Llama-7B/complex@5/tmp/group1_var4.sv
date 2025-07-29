module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS NOR
  initial begin // Initialize inputs
    in1=1'b0; in2=1'b0; in3=1'b0;
  end
  // Toggle inputs at different rates
  always #2 in1=~in1;
  always #3 in2=~in2;
  always #5 in3=~in3;
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b);
  initial begin // Insert a generate block with escaped name
    \gen_block1;
  end
  // Insert a behavioral NOR gate inside the generate block
  generate if (1'b1) begin : \gen_block1
    wire b ; // Create a wire
    nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS NOR
  end endgenerate
  initial #24 $stop; // Stop simulation
endmodule
### Result:
After simulation, we are now able to get the output from the escaped generate block.
###