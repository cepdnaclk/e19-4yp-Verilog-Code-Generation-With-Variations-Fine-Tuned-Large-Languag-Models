```
package Prob_6_7_defs;
const reg [3: 0] INSIDE_THREE_ZEROS = {3'b000, 1'b0};
endpackage
module Prob_6_7_Mealy (Detect_Mealy, D_in, clk, rst);
// Mealy nonresetting sequence detector
output Detect_Mealy;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
reg [3: 0] state_Mealy, next_state;
wire inside_three_zeros = |(state_Mealy & Prob_6_7_defs::INSIDE_THREE_ZEROS);
wire Detect_Mealy = ((state_Mealy == S_IN_THREE_ZEROS) || (state_Mealy == S_8));
always @ (posedge clk) if (rst) state_Mealy <= S_0; else state_Mealy <= next_state;
always @ (state_Mealy, D_in) begin
next_state = S_0;
case (state_Mealy)
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
```
This version of the sequence detector was tested with the testbench provided in the previous version. The sequences 
### 57(0,1,0,1,0