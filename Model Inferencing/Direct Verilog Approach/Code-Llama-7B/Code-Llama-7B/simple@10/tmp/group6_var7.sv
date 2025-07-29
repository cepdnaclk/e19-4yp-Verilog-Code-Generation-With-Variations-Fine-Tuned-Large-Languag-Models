module ALU ( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### Original Test Bench code:
module ALU_Test ( );
reg [7:0] a; reg [7:0] b; wire pass; reg add; reg [7:0] result;
// Instantiate the Unit Under Test (UUT)
ALU uut (.a(a),.b(b),.pass(pass),.add(add),.alu_out(result) );
initial begin
$dumpfile("ALU.vcd"); $dumpvars(1, ALU_Test);    // Generate VCD
#5; // Delay = 5 ns
a = 10; b = 13; pass = 1; add = 1; #5;
#5; // Delay = 10 ns
a = 00; b = 23; pass = 0; add = 0; #10;
#5; // Delay = 15 ns
a = 12; b = 00; pass = 1; add = 0; #15;
#5; // Delay = 20 ns
a = 20; b = 20; pass = 0; add = 1; #25;
#5; // Delay = 25 ns
a = 20; b = 20; pass = 1; add = 1; #30;
#5; // Delay = 30 ns
a = 20; b = 20; pass = 1; add = 0; #35;
end
endmodule
### Variation Instruction:
Replace the old a and b reg types with logic to align with modern signal declaration.
### Modified Test Bench