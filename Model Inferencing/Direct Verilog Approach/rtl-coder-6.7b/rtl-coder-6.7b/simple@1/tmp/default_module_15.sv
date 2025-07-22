```
module ALU_tb;
  reg clk;
  reg [3:0] opcode;
  reg [15:0] a, b;
  wire [15:0] y;
  reg [15:0] expected_y;
  reg error;
  reg [15:0] num_errors;
  
  // Instantiate the unit under test
  ALU uut(a, b, opcode, y);
  
  initial begin
    // Initialize test inputs
    clk = 0;
    opcode = 0;
    a = 0;
    b = 0;
    
    // Test case 1: a + b
    opcode = 4'b0000;
    a = 16'b0000_0000_1111_1000;
    b = 16'b0000_0000_0000_0011;
    expected_y = 16'b0000_0000_1111_1011;
    
    // Test case 2: a - b
    opcode = 4'b0001;
    a = 16'b0000_0000_0000_0011;
    b = 16'b0000_0000_1111_1000;
    expected_y = 16'b1111_1111_1111_1111;
    
    // Test case 3: a & b
    opcode = 4'b0010;
    a = 16'b1111_1111_1111_1111;
    b = 16'b0101_0101_0101_0101;
    expected_y = 16'b0101_0101_0101_0101;
    
    // Test case 4: a | b
    opcode = 4'b0011;
    a = 16'b0101_0101_0101_0101;
    b = 16'b1111_1111_1111_1111;
    expected_y = 16'b1111_1111_1111_1111;
    
    // Test case 5: a ^ b
    opcode = 4'b0100;
    a = 16'b1111_1111_1111_1111;
    b = 16'b1111_1111_1111_1111;
    expected_y = 16'b0000_0000_0000_0000;
    
    // Test case 6: a << 1
    opcode = 4'b0101;
    a = 16'b0000_0000_0000_0001;
    b = 16'b0000_0000_0000_0000;
    expected_y = 16'b0000_0000_0000_0010;
    
    // Test case 7: a >> 1
    opcode = 4'b0110;
    a = 16'b0000_0000_0000_0010;
    b = 16'b0000_0000_0000_0000;
    expected_y = 16'b0000_0000_0000_0001;
    
    // Test case 8: a >> 2
    opcode = 4'b0111;
    a = 16'b0000_0000_0000_0100;
    b = 16'b0000_0000_0000_0000;
    expected_y = 16'b0000_0000_0000_0010;
    
    // Test case 9: (a + b) - b
    opcode = 4'b1000;
    a = 16'b0000_0000_1111_1000;
    b = 16'b0000_0000_0000_0011;
    expected_y = 16'b0000_0000_1111_1001;
    
    // Test case 10: NOT a
    opcode = 4'b1001;
    a = 16'b0000_0000_1111_1000;
    b = 16'b0000_0000_0000_0000;
    expected_y = 16'b1111_1111_1000_0111;
    
    // Test case 11: SIGNED a + b
    opcode = 4'b1010;
    a = 16'b0111_1111_1111_1111;
    b = 16'b0000_0000_0000_0001;
    expected_y = 16'b0111_1111_1111_1111;
    
    // Test case 12: SIGNED a - b
    opcode = 4'b1011;
    a = 16'b0000_0000_0000_0001;
    b = 16'b1000_0000_0000_0000;
    expected_y = 16'b1000_0000_0000_0001;
    
    // Test case 13: SIGNED a << 1
    opcode = 4'b1100;
    a = 16'b1111_1111_1111_1111;
    b = 16'b0000_0000_0000_0000;
    expected_y = 16'b1111_1111_1111_1110;
    
    // Test case 14: SIGNED a >> 1
    opcode = 4'b1101;
    a = 16'b1000_0000_0000_0000;
    b = 16'b0000_0000_0000_0000;
    expected_y = 16'b1100_0000_0000_0000;
    
    // Test case 15: SIGNED a >> 2
    opcode = 4'b1110;
    a = 16'b1100_0000_0000_0000;
    b = 16'b0000_0000_0000_0000;
    expected_y = 16'b1110_0000_0000_0000;
    
    // Initialize the clock
    clk = 1;
    #2;
    clk = 0;
    #2;
  
    // Wait for 10ns
    #10;
    
    // Check for errors
    error = 0;
    num_errors = 0;
    for (int i = 0; i < 15; i++) begin
      if (y!== expected_y) begin
        error = 1;
        num_errors = num_errors + 1;
        $display("Error at test case %0d: expected %h, got %h", i, expected_y, y);
      end
      clk = 1;
      #2;
      clk = 0;
      #2;
    end
    
    if (num_errors == 0) begin
      $