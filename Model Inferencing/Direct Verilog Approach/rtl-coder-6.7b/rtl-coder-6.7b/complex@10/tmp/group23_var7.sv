```
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
reg [3:0] ir_input [0:255];
initial begin
ir_input[0] = 'h60;
ir_input[1] = 'h70;
ir_input[2] = 'h80;
ir_input[3] = 'h90;
ir_input[4] = 'hA0;
ir_input[5] = 'hB0;
ir_input[6] = 'hC0;
ir_input[7] = 'hD0;
ir_input[8] = 'hE0;
ir_input[9] = 'hF0;
ir_input[10] = 'h00;
ir_input[11] = 'h01;
ir_input[12] = 'h02;
ir_input[13] = 'h03;
ir_input[14] = 'h04;
ir_input[15] = 'h05;
ir_input[16] = 'h06;
ir_input[17] = 'h07;
ir_input[18] = 'h08;
ir_input[19] = 'h09;
ir_input[20] = 'h0A;
ir_input[21] = 'h0B;
ir_input[22] = 'h0C;
ir_input[23] = 'h0D;
ir_input[24] = 'h0E;
ir_input[25] = 'h0F;
ir_input[26] = 'h10;
ir_input[27] = 'h11;
ir_input[28] = 'h12;
ir_input[29] = 'h13;
ir_input[30] = 'h14;
ir_input