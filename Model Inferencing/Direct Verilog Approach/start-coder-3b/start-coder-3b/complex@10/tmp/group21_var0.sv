module Mealy_Nonresetting_Sequence_Detector (Detect_Mealy, D_in, clk, rst);
// in/out: output is Detect_Mealy
// in/out: input is D_in
// in/out: clock is clk
// in/out: reset is rst
// localparam: size is 3
// localparam: S_0 is 0
// localparam: S_1 is 1
// localparam: S_2 is 2
// localparam: S_3 is 3
// localparam: S_5 is 5
// localparam: S_6 is 6
// localparam: S_7 is 7
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
// localparam: D_in_0 is 2
// localparam: D_out_0 is 2
// localparam: Q_out_0 is 2
// localparam: D_in_1 is 0
// localparam: D_out_1 is 0
// localparam: Q_out_1 is 0
// localparam: D_in_2 is 1
// localparam: D_out_2 is 1
// localparam: Q_out_2 is 1
// localparam: D_in_3 is 0
// localparam: D_out_3 is 0
// localparam: Q_out_3 is 0
parameter S_5 = 5, S_6 = 6, S