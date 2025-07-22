```verilog
package prob_6_7_pkg;
  parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
  parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
  parameter SET = {S_0, S_1, S_2, S_3, S_4, S_5, S_6, S_7, S_8};
endpackage: prob_6_7_pkg

module Prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
  // Moore nonresetting sequence detector
  import prob_6_7_pkg::*;
  output Detect_Moore;
  input D_in, clk, rst;
  reg [3: 0] state_Moore, next_state;
  wire Detect_Moore = ((state_Moore == S_4) || (state_Moore == S_8));
  always @ (posedge clk) if (rst) state_Moore <= S_0; else state_Moore <= next_state;
  always @ (state_Moore, D_in) begin
    next_state = S_0;
    if (inside(state_Moore,SET)) begin
      case (state_Moore)
        S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_5;
        S_1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_5;
        S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_5;
        S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_4;
        S_4: if (D_in) next_state = S_1; else if (D_in == 0) next_state =