module Prob_6_7_Mealy (Detect_Mealy, D_in);
// Mealy nonresetting sequence detector
output Detect_Mealy;
input D_in;
localparam logic [1:0] D_3 = {2{1'b1}};
wire Detect_Mealy = D_in inside D_3;
endmodule
### Testbench Code:
`include "Prob_6_7_Mealy.sv"
module Prob_6_7_Mealy_tb;
logic D_in, clk, rst;
logic Detect_Mealy;
Prob_6_7_Mealy dut (Detect_Mealy, D_in, clk, rst);
initial begin
clk = 0;
rst = 0;
D_in = 0;
#10 rst = 1;
#10 rst = 0;
#10 D_in = 1;
#10 D_in = 0;
#10 D_in = 1;
#10 D_in = 0;
#10 D_in = 0;
#10 D_in = 0;
#10 D_in = 1;
#10 D_in = 0;
#10 D_in = 1;
#10 $stop;
end
always #5 clk = ~clk;
endmodule
### Output:
```
Simulation time:   50ns
Detect_Mealy = 0
Detect_Mealy = 0
Detect_Mealy = 0
Detect_Mealy = 0
Detect_Mealy = 0
Detect_Mealy = 0
Detect_Mealy = 0
Detect_Mealy = 0
Detect_Mealy = 0
Detect_Mealy = 1
Detect_Mealy = 1
Detect_Mealy = 1
Detect_Mealy = 1
Detect_Mealy = 1
Simulation exited successfully.
```
### Testbench Code:
```
`include "Prob_6_7_Mealy.sv"
module Prob_6_7_Mealy_tb;
parameter N = 11'd400;
logic [0:N-1] D