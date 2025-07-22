module ALU ( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### Variation Instruction:
Add the following assertions to check the correct output on every clock edge:
assert property (@(posedge clk) (pass & $past(pass)
& ((a & (!b &!(add))) | ((b &!a & add) | (a & b
& add))))) else $error("Error on pass");
assert property (@(posedge clk) ((a & b & add) |
(pass & $past(pass) & (a &!b &!add))) | (a &
~b & ~add) | (~a & b & ~add)) else $error("Error
on add");
assert property (@(posedge clk) (alu_out == (a &
b & add) | (pass & $past(pass) & a) | (a & ~b &
~add) | (~a & b & ~add)) &!(pass & $past(pass)
& (a & b & add)) &!(a & ~b & ~add) &!(~a & b &
~add)) else $error("Error on alu_out");

### Verilog Testbench
module ALU_tb;
reg [7:0] a, b;           // Inputs
reg pass, add;            // Control inputs
reg clk;                  // Clock
wire [7:0] alu_out;       // Output
// Instantiate the ALU
ALU alu_inst (.a(a),.b(b),.pass(pass),.add
(add),.alu_out(alu_out));
// Clock generation process
always #5 clk = ~clk;     // 100 MHz clock
// Stimuli generation process
initial begin
clk = 0;
a = 8'b1011_1011; b = 8'b0110_0110; pass = 1; add
= 0;
#500
a = 8'b1011_1011; b = 8'b0110_0110; pass = 1; add
= 0;
#500
a = 8'b1011_1011; b = 8'b0110_0110; pass = 0; add
= 1;
#500
a = 8'b1011_1011; b = 8'b0110_0110; pass = 0; add
= 0;
#500
a = 8'b1011_1011; b = 8'b0110_0110; pass = 1; add
= 1;
#500
a = 8'b1011_1011; b = 8'b0110_0110; pass = 0; add
= 1;
#500
a = 8'b1011_1011; b = 8'b0110_0110; pass = 1; add
= 1;
#500
$finish;                  // Stop simulation
end
endmodule