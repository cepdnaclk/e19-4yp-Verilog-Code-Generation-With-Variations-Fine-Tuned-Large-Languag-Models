```
// ALU Testbench
module ALU_tb;

  reg [7:0] a, b;
  reg [1:0] op;
  wire [7:0] result;

  ALU uut (
   .a(a), 
   .b(b), 
   .op(op), 
   .result(result)
  );

  initial begin
    // initialize inputs
    a <= 8'b0;
    b <= 8'b0;
    op <= 2'b00;

    // run test cases here
    // test addition
    a <= 8'b00001111;
    b <= 8'b00001111;
    op <= 2'b00;
    #10

    // test subtraction
    a <= 8'b01010101;
    b <= 8'b00110011;
    op <= 2'b01;
    #10

    // test AND
    a <= 8'b11110000;
    b <= 8'b11110000;
    op <= 2'b10;
    #10

    // test OR
    a <= 8'b00001111;
    b <= 8'b00001111;
    op <= 2'b11;
    #10

    // test addition with signed integers
    a <= 8'b00001111;
    b <= 8'b11110001;
    op <= 2'b00;
    #10

    // test subtraction with signed integers
    a <= 8'b10000111;
    b <= 8'b01111001;
    op <= 2'b01;
    #10

    $finish;
  end

endmodule
```

This testbench provides a set of test cases for each operation of the ALU. It includes both unsigned integers and signed integers as inputs to evaluate sign handling. This ensures that