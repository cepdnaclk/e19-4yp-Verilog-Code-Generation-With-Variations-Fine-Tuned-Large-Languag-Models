module control_unit (flush_P0_P1, Ld_P1, Ld_P0, Ld_R0, Ld, En, clock, rst);
output reg flush_P0_P1, Ld_P1, Ld_P0, Ld_R0;
input Ld, En, clock, rst;
reg [1: 0] state, next_state;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
always @ (posedge clock) if (rst) state <= S_idle;
else state <= next_state;
always @ (state, Ld, En) begin
flush_P0_