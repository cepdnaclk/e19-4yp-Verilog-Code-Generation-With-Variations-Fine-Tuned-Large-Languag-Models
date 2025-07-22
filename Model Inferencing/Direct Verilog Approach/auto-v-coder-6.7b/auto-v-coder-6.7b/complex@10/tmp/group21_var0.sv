```verilog
module Prob_6_7_Mealy (Detect, D, clk, rst);
// Mealy nonresetting sequence detector
output Detect;
input D, clk, rst;

parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3;
parameter S_5 = 5, S_6 = 6, S_7 = 7;

reg [2: 0] state, next_state;
wire Detect = (((state == S_3)&&(D == 0)) 
|| ((state == S_7)&&(D == 1)));

// D flip-flop simulation
reg [2:0] di;
always @(posedge clk) begin
    if (rst) di <= 0;
    else if (D) di <= di + 1;
    else di <= 0;
end

// next-state logic
always @(posedge clk) begin
    if (rst) state <= S_0;
    else state <= next_state;
end

always @(state, D, di) begin
    next_state = S_0;
    case (state)
    S_0: if (D) next_state = S_1;
         else if (di inside {2'b11, 2'b10}) next_state = S_5;
    S_1: if (D) next_state = S_2;
         else if (di inside {2'b01, 2'b00}) next_state = S_5;
    S_2: if (D) next_state = S_3;
         else if (di inside {2'b01, 2'b00}) next_state = S_5;
    S_3: if (D) next_state = S_3;
         else if (di inside {2'b01, 2'b00}) next_state = S_5;
    S_5: if (D) next_state = S_1;
         else if (di inside {2'b11, 2'b10}) next_state = S_6;