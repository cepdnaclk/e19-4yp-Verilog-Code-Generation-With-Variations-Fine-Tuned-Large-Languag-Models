module control_unit (out_P0, out_P1, Ld_P1, Ld_P0, flush_P0_P1, Ld_R0, Ld, En, clock, rst);
input [ 7 : 0] x;
output [ 7 : 0] out_P0, out_P1;
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
S_idle: if (En) begin
next_state = S_1;
case (x)
31, 54, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88: out_P1 = 0;
Out_P0[3:0] = x[3:0];
out_P0 = 255; Ld_P0 = 1; end
89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127: out_P1 = 1;
Out_P0[3:0] = x[3:0];
out_P0 = 255; Ld_P0 = 1; end
128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255: out_P1 = 2;
Out_P0[3:0] = x[3:0];
out_P0 = 255; Ld_P0 = 1; end
192: begin next_state = S_idle; flush_P0_P1 = 1; end
193: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
194: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
195: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
196: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
197: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
198: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
199: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
200: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
201: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
202: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
203: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
204: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
205: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
206: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
207: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
208: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
209: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
210: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
211: begin next_state = S_wait; Ld_P1 = 1; Ld_P0 = 1; end
212: begin next_state = S_wait; Ld_P