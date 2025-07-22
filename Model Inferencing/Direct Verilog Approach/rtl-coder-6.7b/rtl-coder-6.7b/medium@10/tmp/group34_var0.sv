module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
localparam [1:0] op_sel_idx = 2'h00;
(* use_dsp = "yes" *) gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(sw),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
always_comb begin
  case (op_sel_idx)
  2'h00: ld = {ld[2], ld[1], ld[0