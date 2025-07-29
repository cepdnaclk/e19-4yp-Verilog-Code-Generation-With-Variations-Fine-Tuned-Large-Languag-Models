module packed_array_parity(in, size);
parameter SIZE = 4;
struct packed [SIZE-1:0] in;
output xor_in, and_in;
assign xor_in = ^in;
assign and_in = &in;
endmodule
### Variation