module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  reg [2:0] packed_logic;
  if (packed_logic[0:1] inside {[0:3]}) begin
    // Specify-block only executes if the condition is true
    specify
      specparam dl1 = 1; // Define specify parameter for s delay
      specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
      // Assign path delays using specparams
      (a, b *> s) = dl1;
      (a, b *> ca) = dl2;
    endspecify
  end
  xor (s,a,b);
  and (ca,a,b);
endmodule
### Testbench Code:
module halfadder_tb;
  reg a,b;
  wire s,ca;
  halfadder dut(s,ca,a,b);
  initial begin
    a = 0; b = 0;
    #10 a = 1; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 1;
  end
endmodule