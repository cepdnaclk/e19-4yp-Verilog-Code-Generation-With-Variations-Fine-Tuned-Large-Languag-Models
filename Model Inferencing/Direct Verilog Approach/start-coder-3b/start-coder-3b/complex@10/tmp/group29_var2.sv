module control_unit (flush_P0_P1, Ld_P1, Ld_P0, Ld_R0, Ld, En, clock, rst);
output reg flush_P0_P1, Ld_P1, Ld_P0, Ld_R0;
input Ld, En, clock, rst;
//parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
reg [1: 0] state, next_state;
reg [5: 0] data;
reg [3: 0] addr;
reg [15: 0] index;
reg [4: 0] i1;
reg [4: 0] i2;
reg [4: 0] i3;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
always @ (posedge clock) if (rst) begin state <= S_idle; data <= 0; end
else begin state <= next_state; data <= data_16; end
always @ (state, Ld, En) begin
flush_P0_P1 = 0;
Ld_P1 = 0;
Ld_P0 = 0;
Ld_R0 = 0;
next_state = S_idle;
case (state)
S_idle: if (En) begin
next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
else begin flush_P0_P1 = 1; end

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

## 10.4 Bringing it all together

### Base Verilog Code:
module main;
reg [15: 0] index = 16'h00;
reg [3: 0] data;
reg [4: 0] addr;
reg [1: 0] state, next_state;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
reg [2: 0] i0, i1, i2;
reg [3: 0] i3;
reg [3: 0] i4;
reg [4: 0] i5;
wire [15: 0] data_16, addr_16;
wire [3: 0] data_4;
wire [1: 0] state;
wire [1: 0] next_state;
wire [2: 0] i0_1, i1_1, i2_1, i3_1, i4_1, i5_1;
wire [3: 0] data_4_1;
reg [1: 0] flush_P0_P1, Ld_P1, Ld_P0, Ld_R0;
wire [4: 0] i0_P1, i1_P1, i2_P1, i3_P1, i4_P1, i5_P1;
reg [1: 0] En;
wire [1: 0] P0, P1, P2;
wire [1: 0] clk, rst;
always @ (posedge clk) if (rst) begin state <= S_idle; end
else begin state <= next_state; end
wire [1: 0] clk_next;
always @ (posedge clk) clk_next = clk;
clk = ~clk;

wire [1: 0] En_next;
always @ (posedge clk) begin
En_next = En;
En = ~En;
end

always @ (posedge clk) begin
case (state)
S_idle: begin
Ld_R0 = 1;
data_16 = 0;
addr_16 = 0;
data_4 = 0;
i0 = 1;
i1 = 1;
i2 = 1;
i3 = 1;
i4 = 1;
i5 = 1;
i0_P1 = 1;
i1_P1 = 1;
i2_P1 = 1;
i3_P1 = 1;
i4_P1 = 1;
i5_P1 = 1;
i0_1 = 1;
i1_1 = 1;
i2_1 = 1;
i3_1 = 1;
i4_1 = 1;
i5_1 = 1;
data_4_1 = 1;
flush_P0_P1 = 1;
Ld_P1 = 1;
Ld_P0 = 1;
next_state = S_1;
if (index < 16'h0100)
data_4 = data;
else
data_4 = data;
end
S_1: begin
data_16 = data;
addr_16 = addr;
next_state = S_full;
data_4_1 = data_4;
i0 = i0_1;
i1 = i1_1;
i2 = i2_1;
i3 = i3_1;
i4 = i4_1;
i5 = i5_1;
i0_P1 = i0_1;
i1_P1 = i1_1;
i2_P1 = i2_1;
i3_P1 = i3_1;
i4_P1 = i4_1;
i5_P1 = i5_1;
i0_1 = i0_1;
i1_1 = i1_1;
i2_1 = i2_1;
i3_1 = i3_1;
i4_1 = i4_1;
i5_1 = i5_1;
if (index < 16'h0100)
begin
data_4 = data;
if (index < 16'h0010)
i0 = 16'h00;
else
i0 = 16'h00;
end
else
begin
data_4 = data;
if (index < 16'h0010)
i0 = 16'h01;
else
i0 = 16'h01;
end
end
if (index < 16'h0200)
data_4 = data;
else
data_4 = data;
end
S_full: begin
next_state = S_wait;
data_4_1 = data_4;
i0_1 = i0;
i1_1 = i1;
i2_1 = i2;
i3_1 = i3;
i4_1 = i4;
i5_1 = i5;
i0_P1 = i0_P1;
i1_P1 = i1_P1;
i2_P1 = i2_P1;
i3_P1 = i3_P1;
i4_P1 = i4_P1;
i5_P1 = i5_P1;
i0_1 = i0_1;
i1_1 = i1_1;
i2_1 = i2_1;
i3_1 = i3_1;
i4_1 = i4_1;
i5_1 = i5_1;
if (index < 16'h0200)