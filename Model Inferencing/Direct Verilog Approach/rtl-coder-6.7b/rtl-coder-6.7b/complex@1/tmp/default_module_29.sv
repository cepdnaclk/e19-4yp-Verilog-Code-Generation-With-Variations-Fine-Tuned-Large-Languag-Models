```
module control_unit (flush_P1, Ld_P1, Ld_P0, En, clock, rst);
output reg flush_P1, Ld_P1, Ld_P0;
input En, clock, rst;
reg [1: 0] state, next_state;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
always @ (posedge clock) if (rst) state <= S_idle;
else state <= next_state;
always @ (state, En) begin
flush_P1 = 0;
Ld_P1 = 0;
Ld_P0 = 0;
next_state = S_idle;
case (state)
S_idle: if (En)
begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
else flush_P1 = 1;

S_1: begin next_state = S_full; Ld_P1 = 1; Ld_P0 = 1; end
S_full: if (En == 1) begin next_state = S_wait; Ld_P1 = 1; end
else next_state = S_wait;
S_wait: if (En == 1) begin next_state = S_1; Ld_P1 = 1; end
else next_state = S_wait;
endcase
end
endmodule
```

## S.4.1.7
### Base Verilog Code:
```
module control_unit (flush_P1, Ld_P1, Ld_