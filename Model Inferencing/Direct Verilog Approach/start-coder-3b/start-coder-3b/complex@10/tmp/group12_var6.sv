// Reset implementation
module dff_rstn(
input d, // Data input
input s, // Synchronous reset input
input r, // Asynchronous reset input
output reg q, // Data output

output reg qbar // Output bar (also called qb)
);

// Reg-level reset
reg_rstn rst(
.q     ( q ),
.d     ( d ),
.s     ( s ),
.r     ( r ));

// Bar implementation
comb_dff comb(
.q     ( q ),
.d     ( r ));

assign qbar = comb.qb;

endmodule