```verilog
module Prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Moore;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
reg [3: 0] state_Moore, next_state;
wire Detect_Moore = (state_Moore == S_4) || (state_Moore == S_8);

always @ (posedge clk) begin
  if (rst)
    state_Moore <= S_0;
  else
    state_Moore <= next_state;
end

always @ (state_Moore, D_in) begin
  next_state = S_0;
  case (state_Moore)
    S_0: begin
      if (D_in) next_state = S_1; 
      else if (D_in == 0) next_state = S_5;
    end
    S_1: begin
      if (D_in) next_state = S_2; 
      else if (D_in == 0) next_state = S_5;
    end
    S_2: begin
      if (D_in) next_state = S_3; 
      else if (D_in == 0) next_state = S_5;
    end
    S_3: begin
      if (D_in) next_state = S_3; 
      else if (D_in == 0) next_state = S_4;
    end
    S_4: begin
      if (D_in) next_state = S_1; 
      else if (D_in == 0) next_state = S_6;
    end
    S_5: begin
      if (D_in) next_state = S_1; 
      else if (D_in == 0) next_state =