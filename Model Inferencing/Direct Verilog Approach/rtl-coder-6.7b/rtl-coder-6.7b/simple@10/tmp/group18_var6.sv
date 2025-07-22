module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ao, ai;
  not #2 (ao,ai);
endmodule
### Testbench:
module show_aa_tb();
  reg ao; reg[4:0] ai;
  reg[4:0] expected_ao;
  show_aa i_show_aa(ao, ai);
  initial begin
    #100
    $display("Expected Outputs");
    // Test inputs 0 to 7
    for(int i=0; i<8; i++) begin
      ai = i;
      #1;
      // Expected output is ~i
      expected_ao = ~i;
      $display("@%0tns: i = 0b%b, expected_ao = 0b%b, ao = 0b%b", $time, ai, expected_ao, ao);
      if(ao!== expected_ao) begin
        #1 $display("Test failed for inputs i = 0b%b", i);
        $finish;
      end
    end
    #100
    $display("Done");
    $finish;
  end
endmodule
### Simulation Output:
Expected Outputs
@47ns: i = 0b00000, expected_ao = 0b11111, ao = 0b11111
@47ns: i = 0b00001, expected_ao = 0b11110, ao = 0b11110
@47ns: i = 0b00010, expected_ao = 0b11101, ao = 0b11101
@47ns: i = 0b00011, expected_ao = 0b11100, ao = 0b11100
@47ns: i = 0b00100, expected_ao = 0b11011, ao = 0b11011
@47ns: i = 0b00101, expected_ao = 0b1101