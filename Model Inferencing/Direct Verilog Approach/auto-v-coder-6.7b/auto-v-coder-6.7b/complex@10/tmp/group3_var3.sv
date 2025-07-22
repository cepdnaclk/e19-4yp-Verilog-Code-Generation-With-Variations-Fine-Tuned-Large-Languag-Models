```verilog
`include "package_file_name.vh"

module Prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
    // Moore nonresetting sequence detector
    output Detect_Moore;
    input D_in, clk, rst;
    import package_name::*;
    reg [3: 0] state_Moore, next_state;
    wire Detect_Moore = ((state_Moore inside {S_4, S_8}));
    always @ (posedge clk) begin
        if (rst) 
            state_Moore <= S_0; 
        else 
            state_Moore <= next_state;
    end
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
            S_