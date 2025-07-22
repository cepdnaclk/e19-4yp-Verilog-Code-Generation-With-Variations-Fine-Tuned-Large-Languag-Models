module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
wire [3:0] c0;
case(s)
2'b00: c0 = c;
2'b01: c0 = c[1:0] << 1;
2'b10: c0 = c[2:1] << 2;
2'b11: c0 = c[3:2] << 3;
endcase
assign z = c0[0];
endmodule