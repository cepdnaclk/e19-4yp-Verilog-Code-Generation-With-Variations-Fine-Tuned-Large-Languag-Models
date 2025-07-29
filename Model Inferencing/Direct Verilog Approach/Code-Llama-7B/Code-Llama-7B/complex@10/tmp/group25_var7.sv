module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
reg [3:0] Adjr;
reg [3:0] HiCount;
generate
if (BCD_in[3]) begin
assign Adjr = 4'b0011;
assign HiCount = BCD_in;
end else begin
assign Adjr = BCD_in[2:0] + 3'b001;
if (BCD_in[2:0] + 3'b001 == 3'b000)
assign HiCount = BCD_in + 3'b010;
else
assign HiCount = BCD_in;
end
endgenerate

assign Excess_3_out = Adjr + {4{HiCount[3]}};
endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);
initial begin
//Simulation Test Pattern
end
endmodule