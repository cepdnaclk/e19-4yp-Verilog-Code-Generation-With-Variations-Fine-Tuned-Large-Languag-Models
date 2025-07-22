module testbench;
  reg clk, reset;
  reg [15:0] inputs [100]; 
  reg [15:0] expected_outputs [100]; 
  wire [15:0] actual_outputs;
  
  // Initialize the input signals to 0
  initial
    begin
      clk = 0;
      reset = 1;
      inputs = {100{16'b0}};
      expected_outputs = {100{16'b0}};
    end
  
  // Create a clock signal
  always 
    #10 clk = ~clk;
  
  // Create a reset signal
  initial
    begin
      reset = 1;
      #20 reset = 0;
    end
  
  // Create a testbench process to drive the inputs and check the outputs
  initial
    begin
      integer i, j;
      for (i = 0; i < 50; i = i + 1)
        begin
          // Generate random inputs and expected outputs
          inputs[i] = $random;
          //expected_outputs[i] = $random;
          
          // Wait for the inputs to be applied
          @(posedge clk);
          
          // Check if the actual output matches the expected output
          assert (actual_outputs === expected_outputs[i])
            $display("Test case %d passed", i);
          else
            $error("Test case %d failed", i);
        end
    end
  
  // Instantiate the DUT
  dff_inst dut1(inputs[i], clk, reset, expected_outputs[i]);
endmodule