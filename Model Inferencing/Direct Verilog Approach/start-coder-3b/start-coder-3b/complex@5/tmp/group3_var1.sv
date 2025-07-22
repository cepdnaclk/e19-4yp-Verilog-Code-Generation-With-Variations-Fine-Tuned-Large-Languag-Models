module Prob_9_FSM (Detect_FSM, D_in, clk, rst);
// Finite State Machine
output Detect_FSM;
input D_in, clk, rst;
parameter s0 = 0;
parameter s1 = 1;
reg [2: 0] state_FSM, next_state;
always @ (posedge clk) if (rst) state_FSM <= s0; else state_FSM <= next_state;
always @ (state_FSM) begin
next_state = s0;
case (state_FSM)
s0: if ((D_in == 1) && (D_in == 0)) next_state = s1;
s1: if ((D_in == 0) && (D_in == 0)) next_state = s0;
s1: if ((D_in == 0) && (D_in == 1)) next_state = s0;
default: next_state = s0;
endcase
end
endmodule

## Probability 10

Problem

Implement the following Moore finite state machine:

Solution

### Base Verilog Code:
module Prob_10_FSM (Detect_FSM, D_in