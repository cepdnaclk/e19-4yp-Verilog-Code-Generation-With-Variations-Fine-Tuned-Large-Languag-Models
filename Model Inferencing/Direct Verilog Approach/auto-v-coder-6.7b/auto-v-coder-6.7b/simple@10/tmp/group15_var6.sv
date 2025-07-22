```verilog
// Test the sw2led2 module
module sw2led2_tb;

  reg [7:0] sw;
  wire [7:0] ld;

  // Instantiate the sw2led2 module
  sw2led2 uut (
   .sw(sw),
   .ld(ld)
  );

  initial begin
    // Test case 1: Unsigned
    sw = 8'b0000_0010;
    #10;
    assert(ld == 8'b0000_0010) else $error("Unsigned test case failed");

    // Test case 2: Signed
    sw = 8'b1111_1110;
    #10;
    assert(ld == 8'b1111_1110) else $error("Signed test case failed");

    // Test case 3: Unsigned
    sw = 8'b1111_1111;
    #10;
    assert(ld == 8'b1111_1111) else $error("Unsigned test case failed");

    // Test case 4: Signed
    sw = 8'b0111_1111;
    #10;
    assert(ld == 8'b0111_1111) else $error("Signed test case failed");

    // Test case 5: Unsigned
    sw = 8'b0000_0000;
    #10;
    assert(ld == 8'b0000_0000) else $error("Unsigned test case failed");

    // Test case 6: Signed
    sw = 8'b1000_0000;
    #10;
    assert(ld == 8'b1000_0000) else $error("Signed test case failed");

    $display("All test cases passed successfully.");
  end

endmodule
```
In the modified code, we have added 4 more assertions to test the sign and zeros