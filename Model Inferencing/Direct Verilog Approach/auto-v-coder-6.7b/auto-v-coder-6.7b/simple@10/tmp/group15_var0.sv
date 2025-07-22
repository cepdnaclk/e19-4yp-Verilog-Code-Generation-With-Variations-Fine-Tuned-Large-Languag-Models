```Verilog
// Testbench for ALU
module tb_sw2led2 ();
    reg [7:0] sw;
    wire [7:0] ld;
    reg [7:0] expected_ld;
    reg signed [7:0] sw_signed;
    wire signed [7:0] ld_signed;
    reg signed [7:0] expected_ld_signed;

    sw2led2 uut (
       .sw(sw),
       .ld(ld)
    );

    initial begin
        // Unsigned case
        sw = 8'b10010101;  // Input binary 10010101
        #10; // Delay for 10ns to allow inputs to settle
        expected_ld = sw;  // Expected output is the same as input, in unsigned case
        $display("Test Unsigned: Input: %b, Output: %b, Expected: %b, Pass: %b", sw, ld, expected_ld, ld == expected_ld);

        // Signed case
        sw_signed = -4'b101;  // Input signed binary 101
        #10; // Delay for 10ns to allow inputs to settle
        expected_ld_signed = sw_signed;  // Expected output is the same as input, in signed case
        $display("Test Signed: Input: %b, Output: %b, Expected: %b, Pass: %b", sw_signed, ld_signed, expected_ld_signed, ld_signed == expected_ld_signed);
    end
endmodule
```
In this modified code, we are testing two different inputs: an 8-bit unsigned value and an 8-bit signed value. The expected and actual outputs for unsigned and signed test cases are stored in their respective variables, and then printed. This makes it easy to verify the correctness of the design.

We are using `$display` to print the inputs, outputs, expected values, and whether the test passed or failed. This is a simple and convenient way to check the correctness of the design. In this case,