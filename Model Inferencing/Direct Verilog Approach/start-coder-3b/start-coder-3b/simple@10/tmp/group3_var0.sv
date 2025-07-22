module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output [2:0] sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Output:
```
Verilog syntax check ok
### Question 3
A system designer is writing a Verilog testbench for a new module. The module consists of two 4-bit full adders with the following interface: module full_adder(i1, i2, cin, sum, cout);
input [3:0] i1, i2, cin;
output [3:0] sum, cout;
endmodule
What is the correct way to initialize the sum and cout signals in the testbench?

1. sum = 0, cout = 0;
2. sum = "0", cout = "0";
3. sum = 4'b0, cout = 4'b0;
4. sum = 4'b0, cout = 4'b0;
5. sum = 4'd0, cout = 4'd0;
6. sum = 4'b0, cout = 4'b0;
7. sum = 4'b0, cout = 4'b0;
8. sum = 4'b0, cout = 4'b0;
9. sum = 4'b0, cout = 4'b0;
10. sum = 4'b0, cout = 4'b0;
11. sum = 4'b0, cout = 4'b0;
### Answer:
1. sum = 0, cout = 0;
2. sum = "0", cout = "0";
3. sum = 4'b0, cout = 4'b0;
4. sum = 4'b0, cout = 4'b0;
5. sum = 4'd0, cout = 4'd0;
6. sum = 4'b0, cout = 4'b0;
7. sum = 4'b0, cout = 4'b0;
8. sum = 4'b0, cout = 4'b0;
9. sum = 4'b0, cout = 4'b0;
10. sum = 4'b0, cout = 4'b0;
11. sum = 4'b0, cout = 4'b0;

### Question 4
A Verilog testbench is being written for a module with the following interface: module full_adder(i1, i2, cin, sum, cout);
input [3:0] i1, i2, cin;
output [3:0] sum, cout;
endmodule
Which of the following is the correct way to connect the sum and cout signals to inputs in the testbench?

1. create_testbench {
$display("TEST");
initial {
sum = 4'b0000;
cout = 4'b0000;
}
}
2. create_testbench {
$display("TEST");
initial {
sum = "0000";
cout = "0000";
}
}
3. create_testbench {
$display("TEST");
initial {
sum = 4'h0000;
cout = 4'h0000;
}
}
4. create_testbench {
$display("TEST");
initial {
sum = 4'h0000;
cout = 4'b0000;
}
}
5. create_testbench {
$display("TEST");
initial {
sum = 4'b0000;
cout = 4'b0000;
}
}
6. create_testbench {
$display("TEST");
initial {
sum = 4'b0;
cout = 4'b0;
}
}
7. create_testbench {
$display("TEST");
initial {
sum = 4'o0000;
cout = 4'o0000;
}
}
8. create_testbench {
$display("TEST");
initial {
sum = 4'o0000;
cout = 4'b0000;
}
}
9. create_testbench {
$display("TEST");
initial {
sum = 4'b0000;
cout = 4'o0000;
}
}
10. create_testbench {
$display("TEST");
initial {
sum = 4'd0000;
cout = 4'd0000;
}
}
11. create_testbench {
$display("TEST");
initial {
sum = 4'd0000;
cout = 4'd0000;
}
}
12. create_testbench {
$display("TEST");
initial {
sum = 4'b0;
cout = 4'd0000;
}
}
13. create_testbench {
$display("TEST");
initial {
sum = 4'o0000;
cout = 4'd0000;
}
}
14. create_testbench {
$display("TEST");
initial {
sum = 4'd0000;
cout = 4'b0000;
}
}
### Answer:
1. create_testbench {
$display("TEST");
initial {
sum = 4'b0000;
cout = 4'b0000;
}
}
2. create_testbench {
$display("TEST");
initial {
sum = "0000";
cout = "0000";
}
}
3. create_testbench {
$display("TEST");
initial {
sum = 4'h0000;
cout = 4'h0000;
}
}
4. create_testbench {
$display("TEST");
initial {
sum = 4'b0000;
cout = 4'b0000;
}
}
5. create_testbench {
$display("TEST");
initial {
sum = 4'b0;
cout = 4'b0;
}
}
6. create_testbench {
$display("TEST");
initial {
sum = 4'o0000;
cout = 4'o0000;
}
}
7. create_testbench {
$display("TEST");
initial {
sum = 4'o0000;
cout = 4'b0000;
}
}
8. create_testbench {
$display("TEST");
initial {
sum = 4'b0000;
cout = 4'o0000;
}
}
9. create_testbench {
$display("TEST");
initial {
sum = 4'd0000;
cout = 4'd0000;
}
}
10. create_testbench {
$display("TEST");
initial {
sum = 4'd0000;
cout = 4'd0000;
}
}
11. create_testbench {
$display("TEST");
initial {
sum = 4'b0;
cout = 4'd0000;
}
}
12. create_testbench {
$display("TEST");
initial {
sum = 4'o0000;
cout = 4'd0000;
}
}
13. create_testbench {
$display("TEST");
initial {
sum = 4'd0000;
cout = 4'b0000;
}
}
14. create_testbench {
$display("TEST");
initial {
sum = 4'd0000;
cout = 4'd0000;
}
}

### Question 5
A System designer is writing a Verilog testbench for a new module. The module consists of two 4-bit full adders with the following interface: module full_adder(i1, i2, cin, sum, cout);
input [3:0] i1, i2, cin;
output [3:0] sum, cout;
endmodule
How many ways are there to initialize the sum and cout signals in the testbench?

1. 4
2. 16
3. 128
4. 4096

### Answer:
1. 4
2