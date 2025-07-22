module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  initial begin : gen_block2
    in1=1'b0; in2=1'b0; in3=1'b0;
  end
  // Toggle inputs at different rates
  always #2 in1=~in1;
  always #3 in2=~in2;
  always #5 in3=~in3;
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b); // Removed newline
  initial #24 $stop; // Stop simulation
endmodule