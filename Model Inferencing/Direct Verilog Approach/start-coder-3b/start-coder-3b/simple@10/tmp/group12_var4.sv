```
module Problem6(input [3:0] a, b, output reg [3:0] sum);
  reg clk, rst, d;

  always_ff @(posedge clk) begin
    if (rst) begin
      sum <= 4'b0000;
    end
    else if (d) begin
      sum <= a + b;
    end
  end

  initial begin
    clk = 0;
    rst = 0;
    d = 1;
    #2 d = 1;
    #2 clk = 1;
  end
endmodule
```
/Lab 15/README.md
# Lab 15

## Problems

### Problem 1

- [Problem 1](./Problem1.png)
- [Trace](./traces/1.txt)

### Problem 2

- [Problem 2](./Problem2.png)
- [Trace](./traces/2.txt)

### Problem 3

- [Problem 3](./Problem3.png)
- [Trace](./traces/3.txt)
/Lab 8/README.md
# Lab 8 - System Verilog

## Problems

### Problem 1

- [Problem 1](./Problem1.png)
- [Trace](./traces/1.txt)

### Problem 2

- [Problem 2](./Problem2.png)
- [Trace](./traces/2.txt)

### Problem 3

- [Problem 3](./Problem3.png)
- [Trace](./traces/3.txt)

### Problem 4

- [Problem 4](./Problem4.png)
- [Trace](./traces/4.txt)

### Problem 5

- [Problem 5](./Problem5.png)
- [Trace](./traces/5.txt)

### Problem 6

- [Problem 6](./Problem6.png)
- [Trace](./traces/6.txt)

### Problem 7

- [Problem 7](./Problem7.png)
- [Trace](./traces/7.txt)

### Problem 8

- [Problem 8](./Problem8.png)
- [Trace](./traces/8.txt)
/Lab 12/README.md
# Lab 12 - System Verilog

## Problems

### Problem 1

- [Problem 1](./Problem1.png)
- [Trace](./traces/1.txt)

### Problem 2

- [Problem 2](./Problem2.png)
- [Trace](./traces/2.txt)

### Problem 3

- [Problem 3](./Problem3.png)
- [Trace](./traces/3.txt)

### Problem 4

- [Problem 4](./Problem4.png)
- [Trace](./traces/4.txt)

### Problem 5

- [Problem 5](./Problem5.png)
- [Trace](./traces/5.txt)

### Problem 6

- [Problem 6](./Problem6.png)
- [Trace](./traces/6.txt)
/Lab 14/README.md
# Lab 14 - System Verilog

## Problems

### Problem 1

- [Problem 1](./Problem1.png)
- [Trace](./traces/1.txt)

### Problem 2

- [Problem 2](./Problem2.png)
- [Trace](./traces/2.txt)

### Problem 3

- [Problem 3](./Problem3.png)
- [Trace](./traces/3.txt)
/Lab 11/Problem6.py
#  - 21801123

# Problem 6

import math

s = [3, 1, 4, 1, 5, 9, 2, 6, 5]

# Problem 6

while True:
    # Get the input
    num = input("Please enter a number in the range 1 to 10: ")

    # Check if the input is one
    if num == "1":
        # Get the value k
        k = input("Please enter a value: ")
        k = int(k)

        # Get the value q
        q = input("Please enter a value: ")
        q = int(q)

        # Get the value r
        r = input("Please enter a value: ")
        r = int(r)

        # Check if they are in range
        if k <= q and k <= r:
            break

    # The input is invalid
    else:
        print("Please enter a valid value")

# Get the value x from the user
x = input("Please enter a value: ")
x = int(x)

# Print the output
print(
    f"The output is {"{" if q == 1 else "{" if r == 1 else "["}x+5, x+10, x+15}."
)

# Print the output
print(
    f"The output is {"{" if q == 2 else "{" if r == 2 else "["}x+5, x+10, x+15}."
)

# Print the output
print(
    f"The output is {"{" if q == 3 else "{" if r == 3 else "["}x+5, x+10, x+15}."
)

# Print the output
print(
    f"The output is {"{" if q == 4 else "{" if r == 4 else "["}x+5, x+10, x+15}."
)