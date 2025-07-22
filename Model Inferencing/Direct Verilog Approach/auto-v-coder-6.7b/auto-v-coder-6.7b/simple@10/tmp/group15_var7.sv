```verilog
`timescale 1ns / 1ps

module ALU_testbench();
  reg signed [7:0] a, b;
  reg opcode; // 0 = add, 1 = subtract
  wire signed [7:0] result;
  
  ALU uut(
   .a(a),
   .b(b),
   .opcode(opcode),
   .result(result)
  );
  
  // Test cases
  initial begin
    // Addition
    a = 8'd50;
    b = 8'd100;
    opcode = 0;
    #10; // Wait for the circuit to settle
    assert(result === 8'd150)
      $display("Addition test passed.");
    else
      $error("Addition test failed.");
    
    // Subtraction
    a = 8'd100;
    b = 8'd50;
    opcode = 1;
    #10;
    assert(result === 8'd50)
      $display("Subtraction test passed.");
    else
      $error("Subtraction test failed.");
    
    // Negative subtraction
    a = 8'd50;
    b = 8'd100;
    opcode = 1;
    #10;
    assert(result === -8'd50)
      $display("Negative subtraction test passed.");
    else
      $error("Negative subtraction test failed.");
    
    // Negative addition
    a = -8'd50;
    b = 8'd100;
    opcode = 0;
    #10;
    assert(result === -8'd50)
      $display("Negative addition test passed.");
    else
      $error("Negative addition test failed.");
    
    $finish;
  end
endmodule
```
In this modification, we have added signed test cases for additions and subtractions. This can be beneficial to test signed integer handling in more depth. We used signed 8-bit numbers to test both positive and negative numbers. Addition and subtraction are performed with both positive and negative operands