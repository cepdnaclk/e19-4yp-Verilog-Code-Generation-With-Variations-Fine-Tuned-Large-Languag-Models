module par(in, parity, all_ones);
input [3:0][7:0] in;
output parity, all_ones;
assign parity = ^in;
assign all_ones = &in;
endmodule
### Simulation of Modified Code:
![Simulation](https://github.com/parth2702/CPEN-391-Digital-Design/blob/main/Labs/Task1/task1_sim3_testbench_100MHz.PNG)
### Modification Task 4:

#### Description of task:
Modify the code by removing the ‘assign’ keyword from the statements that perform the bitwise operations. Also, add a local wire for each bitwise operation.

#### Steps to Modify:
### Base Verilog Code:
module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
assign parity = ^in;
assign all_ones = &in;
endmodule
### Modification Task 4:
module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
wire[7:0] tmp;
logic parity_in, all_ones_in;
assign parity_in = ^in;
assign all_ones_in = &in;
assign tmp = ^in;
assign parity = parity_in;
assign all_ones = all_ones_in;
endmodule
### Simulation of Modified Code:
![Simulation](https://github.com/parth2702/CPEN-391-Digital-Design/blob/main/Labs/Task1/task1_sim4_testbench_100MHz.PNG)

### Modification Task 5:
#### Description of task:

Modify the code by removing the ‘assign’ keyword from the statements that perform the bitwise operations. Also, add a local wire for each bitwise operation. However, now connect each bitwise operation to a different wire.

#### Steps to Modify:
### Base Verilog Code:
module par(in,