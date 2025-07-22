module par(parity, all_ones);
logic [7:0] x1, x2, x3, x4;
logic parity, all_ones, parity_out, parity_res, all_ones_res;
always_comb begin
x1 = 8'b11111111;
x2 = 8'b01010101;
x3 = 8'b10011101;
x4 = 8'b01110011;
parity_res = ^x1 & ^x2 & ^x3 & ^x4;
all_ones_res = &x1 & &x2 & &x3 & &x4;
end
endmodule