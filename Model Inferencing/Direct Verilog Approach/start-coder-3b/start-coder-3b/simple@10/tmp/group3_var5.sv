module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output logic [1:0] cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Original and Modified Code:
original:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
modified:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output logic cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Results:
| Input          | Original    | Modified          |
| -------------- | ----------  | ----------------- |
| 00             | 000         | 000               |
| 01             | 000         | 110               |
| 10             | 000         | 110               |
| 11             | 110         | 111               |
### Comments:
Logic-vectors are compatible with wires.
/labs/lab3/lab3.md
# Lab 3

## Part 1

### Question 1 (15 pts): 
a) How would you modify the code below to use a loop?
```
always @(posedge clk)
  begin
    a <= a ^ b;
    b <= a ^ b;
  end
```
b) How long does it take for the counter to reach 50? How does this compare to the value of clk you used in `always` block? Why?

### Question 2 (15 pts):
a) How would you modify the code below to use a loop?
```
always @(posedge clk)
  begin
    a <= a ^ b;
    b <= a ^ b;
  end
```
b) How long does it take for the counter to reach 50? How does this compare to the value of clk you used in `always` block? Why?

## Part 2

### Question 1 (10 pts):

What does `test.v` do?

### Question 2 (10 pts):

Compile `test.v` and run the compiled version. What is the output?

### Question 3 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 4 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

## Part 3

### Question 1 (10 pts):

What does `test.v` do?

### Question 2 (10 pts):

Compile `test.v` and run the compiled version. What is the output?

### Question 3 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 4 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

## Part 4

### Question 1 (10 pts):

What does `test.v` do?

### Question 2 (10 pts):

Compile `test.v` and run the compiled version. What is the output?

### Question 3 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 4 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

## Part 5

### Question 1 (10 pts):

What does `test.v` do?

### Question 2 (10 pts):

Compile `test.v` and run the compiled version. What is the output?

### Question 3 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 4 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

## Part 6

### Question 1 (10 pts):

What does `test.v` do?

### Question 2 (10 pts):

Compile `test.v` and run the compiled version. What is the output?

### Question 3 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 4 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

## Part 7

### Question 1 (10 pts):

What does `test.v` do?

### Question 2 (10 pts):

Compile `test.v` and run the compiled version. What is the output?

### Question 3 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 4 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 5 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

## Part 8

### Question 1 (10 pts):

What does `test.v` do?

### Question 2 (10 pts):

Compile `test.v` and run the compiled version. What is the output?

### Question 3 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 4 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 5 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

## Part 9

### Question 1 (10 pts):

What does `test.v` do?

### Question 2 (10 pts):

Compile `test.v` and run the compiled version. What is the output?

### Question 3 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 4 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 5 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

## Part 10

### Question 1 (10 pts):

What does `test.v` do?

### Question 2 (10 pts):

Compile `test.v` and run the compiled version. What is the output?

### Question 3 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 4 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 5 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

## Part 11

### Question 1 (10 pts):

What does `test.v` do?

### Question 2 (10 pts):

Compile `test.v` and run the compiled version. What is the output?

### Question 3 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question 4 (10 pts):

Use the `always` block in `test.v` and simulate it. Verify that the output is what you expect.

### Question