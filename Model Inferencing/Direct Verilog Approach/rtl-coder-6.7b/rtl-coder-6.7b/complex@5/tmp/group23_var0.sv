module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
     reg [3:0] int_q;
     reg [3:0] rst_val;
     wire [1:0] rr_ir = rr.ir;
     wire [1:0] s_cnt_eq;
     wire [1:0] rr_ir_eq;

     wire [1:0]  rr_ir_inside_g[2];
     generate
         for (genvar i = 0; i < 2; i = i+1)
                  assign rr_ir_inside_g[i] = rr_ir[i] & 1'b1;
         assign s_cnt_eq[0] &