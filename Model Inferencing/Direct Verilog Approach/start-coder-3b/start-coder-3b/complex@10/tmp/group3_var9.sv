module Prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Moore;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
reg [3: 0] state_Moore, next_state;
wire Detect_Moore = ((state_Moore == S_4) || (state_Moore == S_8) || (state_Moore == S_5) || (state_Moore == S_6) || (state_Moore == S_7));
always @ (posedge clk) if (rst) state_Moore <= S_0; else state_Moore <= next_state;
always @ (state_Moore, D_in) begin
next_state = S_0;
case (state_Moore)
S_0: if (D_in) begin
next_state = S_1;
end
else if (D_in == 0) begin
next_state = S_5;
end
S_1: if (D_in) begin
next_state = S_2;
end
else if (D_in == 0) begin
next_state = S_5;
end
S_2: if (D_in) begin
next_state = S_3;
end
else if (D_in == 0) begin
next_state = S_5;
end
S_3: if (D_in) begin
next_state = S_3;
end
else if (D_in == 0) begin
next_state = S_4;
end
S_4: if (D_in) begin
next_state = S_1;
end
else if (D_in == 0) begin
next_state = S_6;
end
S_5: if (D_in) begin
next_state = S_1;
end
else if (D_in == 0) begin
next_state = S_6;
end
S_6: if (D_in) begin
next_state = S_1;
end
else if (D_in == 0) begin
next_state = S_7;
end
S_7: if (D_in) begin
next_state = S_8;
end
else if (D_in == 0) begin
next_state = S_7;
end
S_8: if (D_in) begin
next_state = S_1;
end
else if (D_in == 0) begin
next_state = S_6;
end
default: begin
next_state = S_0;
end
endcase
end
endmodule

When the input changes state, the state is always changed to 0, so no value is passed to the sequence detector.

##### 6.8.2.12.2. Solution

(a)

```
initial state_Moore = S_0;
always @ (posedge clk)
begin
if (rst) state_Moore <= S_0;
else if (state_Moore == S_4) state_Moore <= S_8;
else if (state_Moore == S_5) state_Moore <= S_6;
else if (state_Moore == S_6) state_Moore <= S_7;
else if (state_Moore == S_7) state_Moore <= S_7;
else if (state_Moore == S_8) state_Moore <= S_6;
end

```

(b)

```
initial state_Moore = S_0;
always @ (posedge clk)
begin
if (rst) state_Moore <= S_0;
else if (D_in == S_0) state_Moore <= S_1;
else if (D_in == S_1) state_Moore <= S_2;
else if (D_in == S_2) state_Moore <= S_3;
else if (D_in == S_3) state_Moore <= S_3;
else if (D_in == S_4) state_Moore <= S_1;
else if (D_in == S_5) state_Moore <= S_1;
else if (D_in == S_6) state_Moore <= S_1;
else if (D_in == S_7) state_Moore <= S_8;
else if (D_in == S_8) state_Moore <= S_1;
end

```

(c)

```
initial state_Moore = S_0;
always @ (posedge clk)
begin
if (rst) state_Moore <= S_0;
else if (D_in == S_0) state_Moore <= S_1;
else if (D_in == S_1) state_Moore <= S_2;
else if (D_in == S_2) state_Moore <= S_3;
else if (D_in == S_3) state_Moore <= S_3;
else if (D_in == S_4) state_Moore <= S_1;
else if (D_in == S_5) state_Moore <= S_1;
else if (D_in == S_6) state_Moore <= S_1;
else if (D_in == S_7) state_Moore <= S_8;
else if (D_in == S_8) state_Moore <= S_1;
end

```

#### 6.8.2.13. Moore nonresetting sequential detector

(a)

```
module Prob_6_8_Moore (D_out, D_in, clk, rst);
// Moore nonresetting sequential detector
output [ 31 : 0 ] D_out;
input [ 31 : 0 ] D_in, clk, rst;
reg [ 5 : 0 ] state_Moore;
reg [ 31 : 0 ] q_4, q_5, q_6, q_7;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
parameter S_9 = 9, S_10 = 10, S_11 = 11, S_12 = 12, S_13 = 13;
parameter S_14 = 14, S_15 = 15, S_16 = 16, S_17 = 17, S_18 = 18;
parameter S_19 = 19, S_20 = 20, S_21 = 21, S_22 = 22, S_23 = 23;
parameter S_24 = 24, S_25 = 25, S_26 = 26, S_27 = 27, S_28 = 28;
parameter S_29 = 29, S_30 = 30, S_31 = 31;
begin
always @ (posedge clk)
begin
if (rst) begin
state_Moore <= S_0;
q_4 <= S_0;
q_5 <= S_0;
q_6 <= S_0;
q_7 <= S_0;
end
else if (state_Moore == S_3) begin
D_out <= (state_Moore == S_4)? q_4 : (state_Moore == S_31)? q_31 : (state_Moore == S_30)? q_30 : (state_Moore == S_29)? q_29 : (state_Moore == S_28)? q_28 : (state_Moore == S_27)? q_27 : (state_Moore == S_26)? q_26 : (state