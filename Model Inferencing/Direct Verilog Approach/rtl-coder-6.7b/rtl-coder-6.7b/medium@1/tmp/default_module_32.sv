module dff(do,di,clk); // Data Flip-Flop
output reg do;
input di,clk;
initial
do=1'b0;
always@(posedge clk) // Positive clock edge
begin
case({di}) inside
{[0 : 0] : 1'b1} : do = 1'b1;
default : do = 1'b0;
endcase
end
endmodule
### Verilog Code:
// Toggle D 3 Times
module dff(do,di,clk); // Data Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1'b0; // Initialize output
always@(posedge clk) // Positive clock edge
begin
do = di;
end
endmodule