```verilog
package seq_pkg;
    const bit [3:0] INSIDE_SET = {1'b0, 1'b1, 1'b1, 1'b0};  // {0, 1, 1, 0}
endpackage

module Prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Moore;
input D_in, clk, rst;

// Importing sequence set from package
import seq_pkg::*;

parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
reg [3: 0] state_Moore, next_state;
wire Detect_Moore = ((state_Moore == S_4) || (state_Moore == S_8));
always @ (posedge clk) if (rst) state_Moore <= S_0; else state_Moore <= next_state;

always @ (state_Moore or D_in or INSIDE_SET) begin
    next_state = S_0;
    case ({state_Moore, D_in, INSIDE_SET})
    // case to change state based on D_in and its current state        
    4'bxxx0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_5;
    4'bxxx1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_5;
    4'bxx10: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_5;
    4'bxx11: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_4;
    4'bx1xx: if