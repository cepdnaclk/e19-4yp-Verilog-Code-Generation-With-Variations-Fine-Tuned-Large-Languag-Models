module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
struct struct_var {
logic [7:0] in;
logic parity;
logic all_ones;
} var;
assign var.in = in;
assign var.parity = ^var.in;
assign var.all_ones = &var.in;
assign parity = var.parity;
assign all_ones = var.all_ones;
endmodule
### Simulation:
![Simulation](https://github.com/mushahidmehdi/digital-electronics-1/blob/main/labs/03-vivado/images/parity_simulation.png)
### Experiment:

1. Data flow

![Data flow](https://github.com/mushahidmehdi/digital-electronics-1/blob/main/labs/03-vivado/images/parity_data_flow.png)

   Signal         | Direction | Description |
   -------------- | --------- | ----------- |
   in             | input     | Input value |
   parity         | output    | Parity      |
   all_ones       | output    | All ones    |
   in             | input     | Input value |
   parity         | output    | Parity      |
   all_ones       | output    | All ones    |

2. Table of combinations

   | in | out | Combination |
   | :- | :-  | :---------- |
   | x  | x   | All 0's     |
   | 0  | 1   | Parity      |
   | 1  | 0   | Parity      |
   | x  | 1   | All 1's     |


### Task

1. Verify all three variations of the parity code by simulating and/or building the variants on different hardware devices.
2. Discuss the structure of the hardware and its operation with respect to the original code.
3. How would you make changes to the code if it had to be synthesized in hardware that does not have