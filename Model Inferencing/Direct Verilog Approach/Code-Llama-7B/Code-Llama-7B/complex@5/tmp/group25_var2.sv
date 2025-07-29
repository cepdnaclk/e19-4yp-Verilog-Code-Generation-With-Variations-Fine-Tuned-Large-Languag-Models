module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
assign Excess_3_out = BCD_in + 3;
endmodule

module t_encoder(BCD_in, Excess_3_out);
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
generate
wire [3:0] HiCount;
wire [3:0] LoCount;
assign HiCount = BCD_in & 8'b11110000;
assign LoCount = BCD_in & 8'b00001111;
inside {HiCount} Adjr;
assign Excess_3_out = BCD_in + 3;
endgenerate
initial begin
  BCD_in = 4'b0010;
  BCD_in = 4'b0011;
  BCD_in = 4'b0100;
  BCD_in = 4'b0101;
  BCD_in = 4'b0110;
  BCD_in