```verilog
module ALU_Testbench();
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] result;
    wire [4:0] alu_control;

    // Instantiate the ALU module
    ALU alu1 (a, b, alu_control, result);

    initial begin
        // Testcase 1: Addition
        alu_control = 5'b00000;
        a = 32'd5;
        b = 32'd7;
        #10;
        $display("Addition result = %d", result);

        // Testcase 2: Subtraction
        alu_control = 5'b00001;
        a = 32'd10;
        b = 32'd5;
        #10;
        $display("Subtract result = %d", result);

        // Testcase 3: AND
        alu_control = 5'b11000;
        a = 32'd15;
        b = 32'd13;
        #10;
        $display("AND result = %d", result);

        // Testcase 4: OR
        alu_control = 5'b11001;
        a = 32'd15;
        b = 32'd13;
        #10;
        $display("OR result = %d", result);

        // Testcase 5: XOR
        alu_control = 5'b11010;
        a = 32'd15;
        b = 32'd13;
        #10;
        $display("XOR result = %d", result);

        // Additional Testcase 6: Signed test
        alu_control = 5'b11111;
        a = 32'd-2;
        b = 32'd3;
        #10;
        $display("Signed test result = %d", result);
        $finish;
    end
endmodule
```
This