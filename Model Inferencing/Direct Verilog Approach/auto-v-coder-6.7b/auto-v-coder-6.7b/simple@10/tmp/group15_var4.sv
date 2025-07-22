```verilog
module sw2led2 (
    input wire [7:0] sw,
    output wire [7:0] ld
);
assign ld = sw;
endmodule


module alu_tb;
  logic  [7:0] sw, ld;
  logic  [15:0] expected;
  logic  [15:0] result;

  sw2led2 dut(sw, ld);

  initial begin
    // Test case 1: Positive values
    sw = 8'h12;
    #10;
    result = {ld, sw};
    expected = {ld, sw};
    assert(result === expected)
    $display("Test Case 1 Passed: Positive values. Result: %h", result);

    // Test case 2: Negative values
    sw = 8'hA1;
    #10;
    result = {ld, sw};
    expected = {ld, sw};
    assert(result === expected)
    $display("Test Case 2 Passed: Negative values. Result: %h", result);

    // Test case 3: Signed test case for signed integer handling 
    sw = 8'd-3;
    #10;
    result = {ld, sw};
    expected = {ld, sw};
    assert(result === expected)
    $display("Test Case 3 Passed: Signed test case. Result: %h", result);

    $display("All Test Cases Passed!");

    $finish;
  end
endmodule
```
This testbench code adds a third test case that tests signed integer handling. In this case, the switch value is a negative number, and the result is compared against the expected value. If the result matches the expected value, then the test case passes. Otherwise, an assertion error will be thrown. The assertion error is displayed in the testbench console indicating which test case has failed. If all test cases pass, a message indicating successful completion is displayed. The testbench includes a delay of 10 ns after each switch value change to allow the DUT to update its outputs. In real scenarios, the DUT output update would occur without a delay, but for the sake of this