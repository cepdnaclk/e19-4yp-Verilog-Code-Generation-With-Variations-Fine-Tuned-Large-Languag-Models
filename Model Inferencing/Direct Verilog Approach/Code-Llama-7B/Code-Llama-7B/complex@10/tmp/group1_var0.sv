module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  genvar i;
  generate
    for( i=0;i<3;i=i+1)
      begin :gen_block1
        nor3NMOS nn_gen(in1,in2,in3,b); // Instantiate NMOS NOR
        // Toggle inputs at different rates
        always #(2*i+1) in1=~in1;
        always #(2*i+2) in2=~in2;
        always #(2*i+3) in3=~in3;
      end
  endgenerate
  initial begin // Initialize inputs
    in1=1'b0; in2=1'b0; in3=1'b0; //Corrected: was 1'b1
  end
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b); // Removed newline
  initial #24 $stop; // Stop simulation
endmodule