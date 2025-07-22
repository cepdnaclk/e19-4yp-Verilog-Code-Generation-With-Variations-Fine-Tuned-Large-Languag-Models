```
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
```
In this code, the Me