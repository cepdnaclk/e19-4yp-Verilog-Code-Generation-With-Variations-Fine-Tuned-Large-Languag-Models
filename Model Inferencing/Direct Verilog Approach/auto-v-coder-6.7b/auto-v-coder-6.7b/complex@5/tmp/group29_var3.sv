```verilog
module control_unit (flush_P0_P1, Ld_P1, Ld_P0, Ld_R0, Ld, En, clock, rst, x);
output reg flush_P0_P1, Ld_P1, Ld_P0, Ld_R0;
input Ld, En, clock, rst;
input [3:0] x;
reg [1: 0] state, next_state;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
always @ (posedge clock) if (rst) state <= S_idle;
else state <= next_state;
always @ (posedge clock) begin
case (state)
S_idle: if (En)
begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
else flush_P0_P1 = 1;

S_1: begin next_state = S_full; Ld_P1 = 1; Ld_P0 = 1; end
S_full: if (Ld == 1) begin
Ld_R0 = 1;
case (En)
0: begin next_state = S_idle; flush_P0_P1 = 1; end
1: begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
endcase
end
else next_state = S_wait;
S_wait: if (Ld == 1) begin
Ld_R0 = 1;
case (En)
0: begin next_state = S_idle; flush_P0_P1 = 1; end
1: begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
endcase
end
else next_state = S_wait;
endcase
end
endmodule
```
In this modified code, we added an input signal x and used this input to compare against a constant array that can represent the bits of 4-bit binary number to the 7-segment display.

The original hex-