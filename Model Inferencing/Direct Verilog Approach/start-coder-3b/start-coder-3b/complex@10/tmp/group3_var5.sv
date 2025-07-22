module Prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Moore;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
reg [3: 0] state_Moore, next_state;
wire Detect_Moore = ((state_Moore == S_4) || (state_Moore == S_8) || (state_Moore inside {S_0, S_2, S_6, S_8}));
always @ (posedge clk) if (rst) state_Moore <= S_0; else state_Moore <= next_state;
always @ (state_Moore, D_in) begin
next_state = S_0;
case (state_Moore)
S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_5;
S_1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_5;
S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_5;
S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_4;
S_4: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_5: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_6: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_7;
S_7: if (D_in) next_state = S_8; else if (D_in == 0) next_state = S_7;
S_8: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
default: next_state = S_0;
endcase
end
endmodule
### Simulation results
### Moore Sequence Detector results with Vivado 2020.2

Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 1 and D_in = 0

The Detect_Moore = 1 is false, and the Detect_Moore = 0 is true
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 0 and D_in = 1

The Detect_Moore = 1 is false, and the Detect_Moore = 0 is true
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 1 and D_in = 1

The Detect_Moore = 1 is false, and the Detect_Moore = 0 is true
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 0 and D_in = 0

The Detect_Moore = 1 is false, and the Detect_Moore = 0 is true
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 1 and D_in = 0

The Detect_Moore = 1 is false, and the Detect_Moore = 0 is true
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 0 and D_in = 1

The Detect_Moore = 1 is false, and the Detect_Moore = 0 is true
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 1 and D_in = 1

The Detect_Moore = 1 is false, and the Detect_Moore = 0 is true
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 0 and D_in = 0

The Detect_Moore = 1 is false, and the Detect_Moore = 0 is true
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 1 and D_in = 0

The Detect_Moore = 1 is false, and the Detect_Moore = 0 is true
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 0 and D_in = 1

The Detect_Moore = 1 is false, and the Detect_Moore = 0 is true
### Computation time of the Moore Sequence Detector with Vivado 2020.2

Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 1 and D_in = 0

The computation time is 0.155 seconds.
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 0 and D_in = 1

The computation time is 0.063 seconds.
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 1 and D_in = 1

The computation time is 0.057 seconds.
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 0 and D_in = 0

The computation time is 0.133 seconds.
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 1 and D_in = 0

The computation time is 0.059 seconds.
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 0 and D_in = 1

The computation time is 0.044 seconds.
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 1 and D_in = 1

The computation time is 0.051 seconds.
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 0 and D_in = 0

The computation time is 0.114 seconds.
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 1 and D_in = 0

The computation time is 0.059 seconds.
Detecting sequence {S_0, S_2, S_6, S_8} with all D_in = 0 and D_in = 1

The computation time is 0.054 seconds.

## 2.8. Moore Sequence Generator

### Base Verilog Code:
module Prob_6_8_Moore (Data_out, D_in, clk, rst);
// Moore random sequence generator
output [3: 0] Data_out;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
reg [3: 0] state_Moore, next_state;
wire [4 : 0] sequence = {state_Moore, next_state};
localparam sequence_table[16][5] =
{
{S_0, S_3, S_6, S_5, S_4},
{S_5, S_6, S_1, S_6, S_7},
{S_6, S_3, S_7, S_8, S_4},
{S_6,