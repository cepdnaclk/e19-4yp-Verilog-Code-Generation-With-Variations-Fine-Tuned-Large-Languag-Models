module test_carry;
//reg a, b, c;
//integer i;
reg [31:0] d;
bit [1:0] d_check;
wire cout;
carry c1(cout, d[0], d[1], d[2]);
//initial
//begin
//for (i = 0; i < 9; i = i + 1)
//begin
//{a, b, c} = i;
//end
//a = 'bx;
//b = 'bx;
//end

generate
for (d_check = 0; d_check < 4; d_check = d_check + 1)
begin
d = d_check;
end
endgenerate

endmodule
`

In this exercise, you’ll make the following additions to your testbench above:

• Add a counter, `i` to the initial block and increment it in the for loop.
• Remove the `a` and `b` assignments. They are now controlled by the values of `d`.
• Move `c` out of the for loop, which will be the output of the carry.
• Move the `$monitor` back inside the for loop; this will make sure that you see the initial values of `c` and `cout` for each iteration of the for loop. • Add a line to print the new `d_check`. This will ensure that each value of `d_check` is printed for each iteration of the loop. • Add an `inside` operator to the `for` loop. This will check to see if the value of `d_check` is one of your desired constants. You’ll be using the `inside` operator to check against a constant array, so make sure that you assign the constant array using the `array_of_constants` construct. • Create a generate block to wrap the latch testbench. Create a counter, `d_check`, and initialize it to zero. Create a for loop that increments the `d_check` variable and outputs each value of the constant array. • Add a line to print the value of `d_check` and the value of `d` for each iteration. • Add a `endgenerate` line to exit the generate block. ### Hint: In Verilog, `inside` is a reserved word. Since it is used with the `for` loop, it must be used as an operator rather than a keyword. You can still use the `array_of_constants` construct with the `inside` operator. Note: Although Verilog has reserved words such as `assert` and `if` for use as keywords, it is still possible to use them as an operator. However, using the `inside` operator is the most common use case. ### Solution: module test_carry; reg [31:0] d; bit [1:0] d_check; wire cout; carry c1(cout, d[0], d[1], d[2]); //initial //begin //for (i = 0; i < 9; i = i + 1) //begin //{a, b, c} = i; //end //a = 'bx; //b = 'bx; //end generate for (d_check = 0; inside(d_check, [0, 1, 2, 3]); d_check = d_check + 1) begin d = d_check; end endgenerate endmodule ### Hint: You can see the output of this code by running the following command: vvp -M. test_carry.vvp ### Base Verilog Code: module counter; reg [31:0] count; integer i; initial begin count = 0; for (i = 0; i < 10; i = i + 1) count = count + 1; end endmodule ### Variation Instruction: Add a constant 4 to the output of the previous testbench. The output should look like this: 4 0 1 2 3 4 (4 times the value 0) ### Modified Code: module counter; reg [31:0] count; integer i; initial begin count = 0; for (i = 0; i < 10; i = i + 1) count = count + 1; end endmodule generate for (count = 4; count < 10; count = count + 1) begin endgenerate ### Solution: module counter; reg [31:0] count; integer i; initial begin count = 0; for (i = 0; i < 10; i = i + 1) count = count + 1; end endmodule generate for (count = 4; count < 10; count = count + 1) begin endgenerate ### Hint: You can see the output of this code by running the following command: vvp -M. counter.vvp ### Base Verilog Code: module counter; reg [31:0] count; integer i; initial begin count = 0; for (i = 0; i < 10; i = i + 1) count = count + 1; end endmodule ### Variation Instruction: Alter the loop in the initial block to print a newline character after each iteration. ### Modified Code: module counter; reg [31:0] count; integer i; initial begin count = 0; for (i = 0; i < 10; i = i + 1) begin count = count + 1; end endmodule ### Solution: module counter; reg [31:0] count; integer i; initial begin count = 0; for (i = 0; i < 10; i = i + 1) begin count = count + 1; end endmodule ### Hint: To see the output of the code, run the following command: vvp -M. counter.vvp ### Base Verilog Code: module adder; reg [31:0] a, b, c; integer i, r; initial begin a = 0, b = 0, c = 0; for (i = 0; i < 10; i = i + 1) begin a = rand; b = rand; r = a + b; c = r + c; end end endmodule ### Variation Instruction: Add a counter, `i`, to the initial block and increment it in the for loop. ### Modified Code: module adder; reg [31:0] a, b, c; integer i, r; initial begin a = 0, b = 0, c = 0; for (i = 0; i < 10; i = i + 1) begin a = rand; b = rand; r = a + b; c = r + c; end end endmodule ### Solution: module adder; reg [31:0] a, b, c; integer i, r; initial begin a = 0, b = 0, c = 0; for (i = 0; i < 10; i = i + 1) begin a = rand; b = rand; r = a + b; c = r + c; end end endmodule ### Hint: To see the output of the code, run the following command: vvp -M. adder.vvp ### Base Verilog Code: module adder; reg [31:0] a, b, c; integer i, r; initial begin a = 0, b = 0, c = 0; for (i = 0; i < 10; i = i + 1) begin a = rand; b = rand; r = a + b; c = r + c; end end endmodule ### Variation Instruction: Add a counter, `i`, to the initial block and increment it in the for loop. Also add an if statement to the initial block that resets `c` every 10 iterations. ### Modified Code: module adder; reg [31:0] a, b, c; integer i, r; initial begin a = 0, b = 0, c = 0; for (i = 0; i < 10; i = i + 1) begin a = rand; b = rand; r = a + b; if (i == 10) c = 0; c = r + c; end end endmodule ### Solution: module adder; reg [31:0] a, b, c; integer i, r; initial begin a = 0, b = 0, c = 0; for (i = 0; i < 10; i = i + 1) begin a = rand; b = rand; r = a + b; if (i == 10) c = 0; c = r + c; end end endmodule ### Hint: To see the output of the code, run the following command: vvp -M. adder.vvp ### Base Verilog Code: module adder; reg [31:0] a, b, c; integer i, r; initial begin a = 0, b = 0, c = 0; for (i = 0; i < 10; i = i + 1) begin a = rand; b = rand; r = a + b; c = r