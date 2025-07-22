module Prob_8_Asy (Detect_Asy, D_in, clk, rst);
// Asynchronous sequence detector
output Detect_Asy;
input D_in, clk, rst;
reg [2: 0] state_Asy, next_state;
wire Detect_Asy = (state_Asy inside {1'b1, 1'b0});
always @ (posedge clk) if (rst) state_Asy <= 2'b00; else state_Asy <= next_state;
always @ (state_Asy, D_in) begin
next_state = 2'b00;
case (state_Asy)
2'b00: if (D_in) next_state = 2'b01; else if (~D_in) next_state = 2'b00;
2'b01: if (D_in) next_state = 2'b10; else if (~D_in) next_state = 2'b00;
2'b10: if (D_in) next_state = 2'b11; else if (~D_in) next_state = 2'b10;
Default: next_state = 2'b00;
endcase
end
endmodule

# 9. Asynchronous sequence detector with constant input

## Asynchronous Sequence detector:

An asynchronous sequence detector can be used to detect the first or the last transition in an asynchronous sequence, such as {a,b,c}.

## Problem:

Design an asynchronous sequence detector to detect the first or the last transition in the asynchronous sequence {a,b,c} with the constant input as {1, 0, 1}.

## Solution:

To design an asynchronous sequence detector with the constant input as {1, 0, 1}, consider the following two problems:

1. How to detect the asynchronous sequence {a,b,c}?
2. How to detect the first or the last transition of the asynchronous sequence {a,b,c}?

The solution is to combine the solutions for the problems 1 and 2 to solve the problem of the asynchronous sequence detector with the constant input as {1, 0, 1}.

The first step is to detect an asynchronous sequence. To do that, I consider the state of the asynchronous sequence detector as the next state of the finite state machine. The next states of the finite state machine are:

Therefore, to detect an asynchronous sequence, I use the following code:

In the next step, I consider the state of the asynchronous sequence detector as the next state of the finite state machine. The next states of the finite state machine are:

Therefore, to detect the first or the last transition in an asynchronous sequence, I use the following code:

## Base Verilog Code:
module Prob_9_Asy (Detect_Asy, D_in, clk, rst);
// Asynchronous sequence detector
output Detect_Asy;
input D_in, clk, rst;
reg [2: 0] state_Asy, next_state;
wire Detect_Asy = (state_Asy == {1'b1, 1'b0});
always @ (posedge clk) if (rst) state_Asy <= 2'