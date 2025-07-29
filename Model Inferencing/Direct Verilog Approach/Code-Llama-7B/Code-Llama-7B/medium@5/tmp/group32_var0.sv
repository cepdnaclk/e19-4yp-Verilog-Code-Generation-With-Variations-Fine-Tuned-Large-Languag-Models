module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk)
begin
	case (di)
		3'b000 : do = 1'b0;
		3'b001 : do = 1'b1;
		3'b010 : do = 1'b1;
		3'b011 : do = 1'b1;
		3'b100 : do = 1'b0;
		3'b101 : do = 1'b1;
		3'b110 : do = 1'b1;
		3'b111 : do = 1'b1;
		default : do = 1'bX;
	endcase
end
endmodule