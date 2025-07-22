module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
wire signed [3:0] a = ArgA[3:0];
wire signed [3:0] b = ArgB[3:0];
wire [3:0] sum = a + b;
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
    (Clk *> sum) = (tRise, tFall);
endspecify
endmodule
### Test Vector:

13 17        // ArgA & ArgB
0           // Result

Test with a simple vector. Output should be 4.

### Test Case:

00 01        // ArgA & ArgB
01           // Result

Test with a simple vector. Output should be 1.

### Test Case:

01 01        // ArgA & ArgB
01           // Result

Test with a simple vector. Output should be 1.

### Test Case:

01 01        // ArgA & ArgB
10           // Result

Test with a simple vector. Output should be 2.

### Test Case:

00 01        // ArgA & ArgB
10           // Result

Test with a simple vector. Output should be 2.

### Simulation Results:

#### Signed Summation Operations

![image](https://user-images.githubusercontent.com/70104023/191402337-f2b08514-2834-428a-a806-910485b2ba1c.png)

#### Unsigned Summation Operations

![image](https://user-images.githubusercontent.com/70104023/191402359-1b8e2461-1f41-4d8a-a6ea-3447fb5d777b.png)
#### Unsigned Summation Operations with Tristate

![image](https://user-images.githubusercontent.com/70104023/191402377-291e764b-247f-433d-a6a9-ec50434b4f52.png)

#### Signed Summation Operations with Tristate

![image](https://user-images.githubusercontent.com/70104023/191402402-03a4d56c-0868-462f-b41c-0ab9f8f63375.png)

#### Tristate and Timing Specification

![image](https://user-images.githubusercontent.com/70104023/191402454-835634e6-ff94-40b6-b247-79e46b07455f.png)
![image](https://user-images.githubusercontent.com/70104023/191402474-e0a4b909-5d77-4c19-bce5-24378a966694.png)
![image](https://user-images.githubusercontent.com/70104023/191402487-390e7b06-838f-4b17-9398-793c50e8d14c.png)