module Prob_6_7_Mealy (Detect_Mealy, D_in, clk, rst);
// Mealy nonresetting sequence detector
output Detect_Mealy;
input D_in, clk, rst;
reg [2: 0] state_Mealy, next_state;
wire Detect_Mealy = (((state_Mealy == 3)&&(D_in == 0))
|| ((state_Mealy == 7)&&(D_in ==1)));
always @ (posedge clk) if (rst) state_Mealy <= 0; else state_Mealy <= next_state;
always @ (state_Mealy, D_in) begin
next_state = 0;
case (state_Mealy)
0: if (D_in) next_state = 1; else if (D_in == 0) next_state = 5;
1: if (D_in) next_state = 2; else if (D_in == 0) next_state = 5;
2: if (D_in) next_state = 3; else if (D_in == 0) next_state = 5;
3: if (D_in) next_state = 3; else if (D_in == 0) next_state = 5;
5: if (D_in) next_state = 1; else if (D_in == 0) next_state = 6;
6: if (D_in) next_state = 1; else if (D_in == 0) next_state = 7;
7: if (D_in) next_state = 1; else if (D_in == 0) next_state = 7;
default: next_state = 0;
endcase
end
endmodule