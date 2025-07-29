module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  genvar i;
  generate 
    for (i=1; i<=4; i=i+1) begin
      if (i==2) begin
        nor3NMOS \gen_block1 (in1,in2,in3,b);
      end
    end
  endgenerate
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
### Code Output:
0 in1 = 0, in2 = 0, in3 = 0, output = 1