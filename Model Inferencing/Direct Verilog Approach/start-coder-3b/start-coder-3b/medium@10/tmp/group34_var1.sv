module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
wire [3:0] sw_sel = {3'b0, sw[1:0], 3'b0, sw[3]};
wire [3:0] and4_out;
wire [3:0] or4_out;
wire [3:0] xor4_out;
gates4 U1 (
.x(sw_sel),
.and4_(and4_out),
.or4_(or4_out),
.xor4_(xor4_out)
);
always @ (posedge sw_sel[1]) case (sw_sel[1])
3'b0: and4_out <= 3'b110;
3'b1: and4_out <= 3'b001;
3'b10: and4_out <= 3'b101;
3'b11: and4_out <= 3'b010;
default: and4_out <= 3'b000; // Default behavior.
endcase
always @ (posedge sw_sel[1]) case (sw_sel[1])
3'b0: or4_out <= 3'b110;
3'b1: or4_out <= 3'b101;
3'b10: or4_out <= 3'b111;
3'b11: or4_out <= 3'b100;
default: or4_out <= 3'b000;
endcase
always @ (posedge sw_sel[1]) case (sw_sel[1])
3'b0: xor4_out <= 3'b110;
3'b1: xor4_out <= 3'b111;
3'b10: xor4_out <= 3'b100;
3'b11: xor4_out <= 3'b010;
default: xor4_out <= 3'b000;
endcase
endmodule