module encoder (BCD_in, Excess_3_out);
input  [3:0] BCD_in;
output [3:0] Excess_3_out;
wire [3:0] HiCount;
wire [3:0] Adjr;
assign Adjr = BCD_in + 3;
assign Excess_3_out = BCD_in + 3;
initial begin
end
initial begin //Simulation Test Pattern
end
endmodule
module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
reg [3:0] Excess_3_out;
generate
reg [3:0] BCD_in;
wire [3:0] HiCount;
wire [3