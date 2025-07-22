module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
wire [3:0] Excess_3_out[4];
generate
initial
begin
Excess_3_out[0] = BCD_in + 3;
Excess_3_out[1] = BCD_in + 3;
Excess_3_out[2] = BCD_in + 3;
Excess_3_out[3] = BCD_in + 3;
end
endgenerate
endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
end
initial begin //Simulation Test Pattern
end
endmodule