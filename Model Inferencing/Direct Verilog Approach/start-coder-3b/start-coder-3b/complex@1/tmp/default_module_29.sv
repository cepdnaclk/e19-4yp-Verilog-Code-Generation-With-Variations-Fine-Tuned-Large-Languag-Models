module hex_to_7seg
(
output reg [ 7 : 0 ] seven_seg,
input [15 : 0 ] x
);
parameter [15 : 0 ] lookup =
16'h000, 16'h000, 16'h780, 16'h790, 16'h788, 16'h798,
16'h784, 16'h794, 16'h000, 16'h008, 16'h000, 16'h000,
16'h000, 16'h000, 16'h000, 16'h000;
always @ ( * )
if ( x == lookup [9] )
seven_seg = 7'h100;
else if ( x == lookup [15] )
seven_seg = 7'h100;
else
seven_seg = 7'h000;
endmodule
### Modified Verilog Code:
module hex_to_7seg
(
output reg [ 7 : 0 ] seven_seg,
input [15 : 0 ] x
);
reg [15 : 0 ] lookup [9 : 0];
always @ ( * ) begin
lookup [0] = 16'h000;
lookup [1] = 16'h000;
lookup [2] = 16'h780;
lookup [3] = 16'h790;
lookup [4] = 16'h788;
lookup [5] = 16'h798;
lookup [6] = 16'h784;
lookup [7] = 16'h794;
lookup [8] = 16'h000;
lookup [9] = 16'h008;
end
if ( x == lookup [9] )
seven_seg = 7'h100;
else if ( x == lookup [15] )
seven_seg = 7'h100;
else
seven_seg = 7'h000;
endmodule

## S-R Finite State Machine

### Base Verilog Code:
module control_unit (flush_P0_P1, Ld_P1, Ld_P0, Ld_R0, Ld, En, clock, rst);
output reg flush_P0_P1, Ld_P1, Ld_P0, Ld_R0;
input Ld, En, clock, rst;
reg [1: 0] state, next_state;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
always @ (posedge clock) if (rst) state <= S_idle;
else state <= next_state;
always @ (state, Ld, En) begin
flush_P0_P1 = 0;
Ld_P1 = 0;
Ld_P0 = 0;
Ld_R0 = 0;
next_state = S_idle;
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

### Variation Instruction:
For the S-R Finite State Machine, use the `case` statement to compare the current state in the state machine with a constant array of states.

### Modified Verilog Code:
module control_unit (flush_P0_P1, Ld_P1, Ld_P0, Ld_R0, Ld, En, clock, rst);
output reg flush_P0_P1, Ld_P1, Ld_P0, Ld_R0;
input Ld, En, clock, rst;
reg [1: 0] state, next_state;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
always @ (posedge clock) if (rst) state <= S_idle;
else state <= next_state;
always @ (state, Ld, En) begin
flush_P0_P1 = 0;
Ld_P1 = 0;
Ld_P0 = 0;
Ld_R0 = 0;
next_state = S_idle;
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

## S-R Finite State Machine Using `case` Statement

This section illustrates the `case` statement in more detail.

### Base Verilog Code:
module control_unit (flush_P0_P1, Ld_P1, Ld_P0, Ld_R0, Ld, En, clock, rst);
output reg flush_P0_P1, Ld_P1, Ld_P0, Ld_R0;
input Ld, En, clock, rst;
reg [1: 0] state, next_state;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
always @ (posedge clock) if (rst) state <= S_idle;
else state <= next_state;
always @ (state, Ld, En) begin
flush_P0_P1 = 0;
Ld_P1 = 0;
Ld_P0 = 0;
Ld_R0 = 0;
next_state = S_idle;
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