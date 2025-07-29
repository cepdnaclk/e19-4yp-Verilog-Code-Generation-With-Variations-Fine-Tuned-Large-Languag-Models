module dffalter_tst(
); // Testbench, likely for a DFF named dffalter
reg di,clk,clr,pr;
wire q;
reg [7:0] pr_r;
parameter DW = 8;
parameter SW = 0;
parameter EW = DW-1;
wire [DW-1:0] pr_vals = {4'b100,4'b001,4'b000,4'b111,4'b110,4'b011,4'b010,4'b001};
// dffalter dff(q,q