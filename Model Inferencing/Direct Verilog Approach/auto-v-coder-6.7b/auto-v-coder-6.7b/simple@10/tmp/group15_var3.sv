```verilog
module sw2led2_tb;

reg [7:0] sw;
wire [7:0] ld;

sw2led2 uut (
   .sw(sw),
   .ld(ld)
);

initial begin
    #1;
    // Unsigned test cases
    sw = 8'b0000_0000; // 0
    #10;
    sw = 8'b1111_1111; // 255
    #10;
    sw = 8'b1010_1010; // 170
    #10;
    // Signed test cases
    sw = 8'b0111_1111; // -1
    #10;
    sw = 8'b1000_0000; // -128
    #10;
    sw = 8'b1100_0000; // -64
    #10;
end

always @(posedge sw) begin
    $display("sw = %b, ld = %b", sw, ld);
end

endmodule
```
In the above code, I added three more signed test cases. These test cases are designed to test the signed integer handling of the ALU. The `8'b0111_1111` case represents -1, `8'b1000_0000` represents -128, and `8'b1100_0000` represents -64. These test cases are intended to verify that the ALU is able to correctly handle signed integers. Each test case is followed by a delay of 10 ns to allow the output to propagate to the `ld` wire. After each test case, the output values of `sw` and `ld` are displayed on the console using `$display`. 

This testbench includes test cases for both unsigned and signed numbers to ensure the ALU works correctly for both types of numbers. Note that these test cases will be useful for any ALU which is expected to handle both signed and unsigned numbers. This is a basic example and may not cover all possible cases or