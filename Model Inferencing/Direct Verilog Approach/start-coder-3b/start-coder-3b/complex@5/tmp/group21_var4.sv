module D_Latch_Var_Instr (D_in, di, next_state, D_out, clk, rst);
// D-latch with variation instruction
output next_state;
input D_in, di, clk, rst;
output reg [3: 0] D_out;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3;
reg [2: 0] state, next_state;
always @ (posedge clk) if (rst) state <= S_0; else state <= next_state;
always @ (state, D_in) begin
next_state = S_0;
case (state)
S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_3;
S_1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_3;
S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_3;
S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_3;
default: next_state = S_0;
endcase
end
endmodule
### Variation Instruction in Verilog:
In the behavioral D-latch, use `inside` operator on `di` to check against a fixed array slice from a dollar unit constant.

// D-latch with variation instruction
output next_state;
input D_in, di, clk, rst;
output reg [3: 0] D_out;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3;
reg [2: 0] state, next_state;
always @ (posedge clk) if (rst) state <= S_0; else state <= next_state;
always @ (state, D_in) begin
next_state = S_0;
case (state)
S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_3;
S_1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_3;
S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_3;
S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_3;
default: next_state = S_0;
endcase
end

### Example for Variation Instruction:
module Prob_6_7_Mealy (Detect_Mealy, D_in, clk, rst);
// Mealy nonresetting sequence detector
output Detect_Mealy;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3;
parameter S_5 = 5, S_6 = 6, S_7 = 7;
reg [2: 0] state_Mealy, next_state;
wire Detect_Mealy = (((state_Mealy == S_3)&&(D_in == 0))
|| ((state_Mealy == S_7)&&(D_in ==1)));
always @ (posedge clk) if (rst) state_Mealy <= S_0; else state_Mealy <= next_state;
always @ (state_Mealy, D_in) begin
next_state = S_0;
case (state_Mealy)
S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_5;
S_1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_5;
S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_5;
S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_5;
S_5: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_6: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_7;
S_7: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_7;
default: next_state = S_0;
endcase
end
endmodule

## Probabilities on the D-Latch

In this exercise, we will investigate the probability of a specific sequence of events.

### Example:
We first define a simple D-latch with variation instruction as the behavioral model and then use the behavioral model for verification. The D-latch is a primitive sequential circuit. The behavioral model is built upon the behavioral model for mealy state machines of Prob_6_7_Mealy. We define the input di as constant 1 and the input D_in as di. Then we set the input clk and rst as 0. Let's run the verification on the behavioral model of the D-latch.

### Base Verilog Code:
module D_Latch_Var_Instr (D_in, di, next_state, D_out, clk, rst);
// D-latch with variation instruction
output next_state;
input D_in, di, clk, rst;
output reg [3: 0] D_out;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3;
reg [2: 0] state, next_state;
always @ (posedge clk) if (rst) state <= S_0; else state <= next_state;
always @ (state, D_in) begin
next_state = S_0;
case (state)
S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_3;
S_1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_3;
S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_3;
S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_3;
default: next_state = S_0;
endcase
end

endmodule
### Variation Instruction in Verilog:
In the behavioral D-latch, use `inside` operator on `di` to check against a fixed array slice from a dollar unit constant.

// D-latch with variation instruction
output next_state;
input D_in, di, clk, rst;
output reg [3: 0] D_out;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3;
reg [2: 0] state, next_state;
always @ (posedge clk) if (rst) state <= S_0; else state <= next_state;
always @ (state, D_in) begin
next_state = S_0;
case (state)
S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_3;
S_1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_3;
S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_3;
S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_3;
default: next_state = S_0;
endcase
end

### Example for Variation Instruction:
module D_Latch_Var_Instr (D_in, di, next_state, D_out, clk, rst);
// D-latch with variation instruction
output next_state;
input