module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(sw),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
wire [2:0] sel;
assign sel[2:0] = sw[2:0]; // assign the 3-bit input'sw' to the 3-bit wire'sel'
wire [2:0] out;
always @(*) begin
case (sel[2:0])
3'b001:
out = ld[2];
3'b010:
out = ld[1];
3'b100:
out = ld[0];
default:
out = 3'bxxx;
endcase
end
endmodule
### Testbench:
module gates4_top_tb;
// Define input and output signals
reg [3:0] sw ;
wire [2:0] ld ;
// Instantiate the top-level module
gates4_top top(.sw(sw),.ld(ld)
);
initial begin
// Initialize input signals
sw = 4'b0000; #10 sw = 4'b0001; #10 sw = 4'b1111; #10
sw = 4'b1010; #10 sw = 4'b0000; #10 sw = 4'b0100; #10
sw = 4'b0010; #10 sw = 4'b0000; #10 sw = 4'b0010; #10
sw = 4'b1000; #10 sw = 4'b0000; #10 sw = 4'b0001; #10
end
initial begin
$dumpfile ("gates4_top.vcd");
$dumpvars (0, gates4_top);
end
endmodule