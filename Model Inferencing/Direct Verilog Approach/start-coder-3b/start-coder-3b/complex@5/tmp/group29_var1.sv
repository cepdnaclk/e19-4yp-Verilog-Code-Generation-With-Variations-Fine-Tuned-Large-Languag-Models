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
else
begin
next_state = S_idle;
flush_P0_P1 = 1;
end

S_1: begin next_state = S_full; Ld_P1 = 1; Ld_P0 = 1; end
S_full: if (Ld == 1) begin
Ld_R0 = 1;
case (En)
0: begin next_state = S_idle; flush_P0_P1 = 1; end
1: begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
endcase
end
else
begin
next_state = S_wait;
flush_P0_P1 = 1;
end

S_wait: if (Ld == 1) begin
Ld_R0 = 1;
case (En)
0: begin next_state = S_idle; flush_P0_P1 = 1; end
1: begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
endcase
end
else
begin
next_state = S_wait;
flush_P0_P1 = 1;
end

endcase
end
endmodule

### Variation Instruction:
This variation is used to make an error-free circuit with a 5-D flip-flop.
### Base Verilog Code:
module 5D_flip_flop (D, Clk, Ck, Q, Q2, Q3);
input D, Clk, Ck;
output reg Q, Q2, Q3;
always @* begin
Q3 <= Q2;
Q2 <= Q;
Q <= D;
end
always @(posedge Clk or posedge Ck) if (Ck)
Q3 <= Q2;
Q2 <= Q;
Q <= D;
endmodule
### Variation Instruction:
This variation is used to test the circuit you developed for the 5-D flip-flop.
### Base Verilog Code:
module testbench_5D_flip_flop;
reg clock, next_clock, Ck;
reg Q1, Q2, Q3, D;
wire [3: 0] Q;
5D_flip_flop ff (D, clock, Ck, Q, Q2, Q3);
initial begin
clock = 0;
next_clock = 0;
end
always # 1 clock = next_clock;
always # 1 next_clock = ~ clock;
initial begin
D = 0;
end
initial begin
# 4; D = 1;
# 4; D = 0;
# 4; D = 1;
# 4; D = 0;
# 4; D = 1;
# 4; D = 0;
# 4; D = 1;
# 4; D = 0;
end
initial begin
# 4; Ck = 1;
# 4; Ck = 0; Ck = 1; end
endalways @(posedge clock or posedge Ck) if (Ck)
Q1 <= Q;
endmodule
### Variation Instruction:
This variation is used to make an error-free circuit with a 5-D flip-flop.
### Base Verilog Code:
module 5D_flip_flop (D, Clk, Ck, Q, Q2, Q3);
input D, Clk, Ck;
output reg Q, Q2, Q3;
always @* begin
Q3 <= Q2;
Q2 <= Q;
Q <= D;
end
always @(posedge Clk or posedge Ck) if (Ck)
Q3 <= Q2;
Q2 <= Q;
Q <= D;
endmodule
### Variation Instruction:
This variation is used to test the circuit you developed for the 5-D flip-flop.
### Base Verilog Code:
module testbench_5D_flip_flop;
reg clock, next_clock, Ck;
reg Q1, Q2, Q3, D;
wire [3: 0] Q;
5D_flip_flop ff (D, clock, Ck, Q, Q2, Q3);
initial begin
clock = 0;
next_clock = 0;
end
always # 1 clock = next_clock;
always # 1 next_clock = ~ clock;
initial begin
D = 0;
end
initial begin
# 4; D = 1;
# 4; D = 0;
# 4; D = 1;
# 4; D = 0;
# 4; D = 1;
# 4; D = 0;
# 4; D = 1;
# 4; D = 0;
end
initial begin
# 4; Ck = 1;
# 4; Ck = 0; Ck = 1; end
endalways @(posedge clock or posedge Ck) if (Ck)
Q1 <= Q;