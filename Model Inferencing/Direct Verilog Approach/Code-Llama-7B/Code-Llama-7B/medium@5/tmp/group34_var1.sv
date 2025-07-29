module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
reg [2:0] mux_out;
wire [2:0] mda_out, and4_, or4_, xor4_;
gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(sw),
.and4_(mda_out[2]),
.or4_(mda_out[1]),
.xor4_(mda_out[0])
);
assign mux_out = mda_out[2]? mda_out : 4'b0;
always_comb begin
case (2'b0) // This is the priority case
2'b00: mux_out = mda_out;
2'b01: mux_out = mda_out;
2'b10: mux_out = mda_out;
2'b11: mux_out = mda_out;
endcase
end
assign ld = mux_out;
endmodule
-----------------------------------------------
### Base Verilog Code:
module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(sw),
.and4