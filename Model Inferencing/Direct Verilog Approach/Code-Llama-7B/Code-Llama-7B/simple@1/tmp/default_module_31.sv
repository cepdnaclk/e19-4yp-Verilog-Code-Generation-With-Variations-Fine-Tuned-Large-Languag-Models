module func1(x1, x2, x3, f);
input x1, x2, x3;
output signed f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Simulation:
* Simulate at 1ns. At 1ns, all the f outputs should be zero.
* Change the inputs from 1 to 0. At 2ns, all the f outputs should be one.
* Change the inputs from 0 to 1. At 3ns, all the f outputs should be zero.

##### Explanation:
The code for the logic and logic signed versions is the same except the output type is different. The testbench code is different. The logic version testbench generates a logic vector. The logic signed version testbench generates a logic signed vector.

##### Screenshot:
![[Screenshot_1.png]](https://github.com/f