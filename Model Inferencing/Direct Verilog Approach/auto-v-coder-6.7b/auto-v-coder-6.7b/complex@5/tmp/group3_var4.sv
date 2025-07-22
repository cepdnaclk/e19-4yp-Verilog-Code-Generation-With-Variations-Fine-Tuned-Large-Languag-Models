```verilog
`include "const_set.vh"

module Prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Moore;
input D_in, clk, rst;
wire Detect_Moore = ((state_Moore == `INSIDE_SET) || (state_Moore == `OUTSIDE_SET));

always @ (posedge clk) if (rst) state_Moore <= 0; else state_Moore <= next_state;
always @ (state_Moore, D_in) begin
next_state = 0;
case (state_Moore)
`INSIDE_SET: if (D_in) next_state = 1; else if (D_in == 0) next_state = 5;
1: if (D_in) next_state = 2; else if (D_in == 0) next_state = 5;
2: if (D_in) next_state = 3; else if (D_in == 0) next_state = 5;
3: if (D_in) next_state = 3; else if (D_in == 0) next_state = 4;
4: if (D_in) next_state = 1; else if (D_in == 0) next_state = 6;
5: if (D_in) next_state = 1; else if (D_in == 0) next_state = 6;
6: if (D_in) next_state = 1; else if (D_in == 0) next_state = 7;
7: if (D_in) next_state = 8; else if (D_in == 0) next_state = 7;
8: if (D_in) next_state = 1; else if (D_in == 0) next_state = 6;
default: next_state = 0;
endcase
end
endmodule
```

In the example above, the constant sets `INSIDE_SET` and `OUTSIDE_SET` are found in a file named `const_set.vh`. This file can be included in the Verilog code to access