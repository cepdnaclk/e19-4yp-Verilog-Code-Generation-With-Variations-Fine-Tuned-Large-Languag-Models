```
module Prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Moore;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
reg [3: 0] state_Moore, next_state;
wire Detect_Moore = ((state_Moore inside {S_4, S_8}));
//wire Detect_Moore = ((state_Moore == S_4) || (state_Moore == S_8));
always @ (posedge clk) if (rst) state_Moore <= S_0; else state_Moore <= next_state;
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
S_8: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
default: next_state = S_0;
endcase
end
endmodule
```
### Code Usage:
```
module prob_6_7_tb ();
reg D_in,clk, rst;
wire Detect_Moore, Detect_Mealy;
Prob_6_7_Mealy prob_6_7_Mealy (Detect_Mealy, D_in, clk, rst);
Prob_6_7_Moore prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
initial begin
    D_in = 0;
    clk = 0;
    rst = 0;
    # 10 rst = 1;
    # 10 rst = 0;
    repeat (100) begin
        # 0.2 D_in = 0;
        # 0.2 D_in = 1;
    end
    repeat (100) begin
        # 0.2 D_in = 1