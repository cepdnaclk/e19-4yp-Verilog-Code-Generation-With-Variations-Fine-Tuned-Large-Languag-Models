module ALU (a, b, pass, add, alu_out);
input [7:0] a;
input [7:0] b;
input pass;
input add;
output logic [7:0] alu_out;
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### Testbench:
module ALU_testbench;
// Local parameters (constants)
parameter input_width = 8;
parameter output_width = 8;

// Inputs
reg [input_width-1:0] a=0;
reg [input_width-1:0] b=0;
reg pass;
reg add;

// Outputs
wire [output_width-1:0] alu_out;

// Instantiate the Unit Under Test (UUT)
// ALU my_alu (a, b, pass, add, alu_out);
ALU my_alu (a, b, pass, add, alu_out);
// Test inputs
initial
begin
// Toggle inputs after 100 ns to allow component to stabilize
#100;
$dumpfile("alu.vcd");
$dumpvars;
pass = 0;
#100; pass=1;
end
// Stimulus
always
begin
#100; a = 1;
#100; a = 2;
a = 3;
end
endmodule
### Simulation:
![ScreenShot_1](ScreenShot_1.png)
### Discussion:
Why have you chosen to use a reg instead of a wire as the output?
regs allow latching, which is when the output of a flip-flop (register) is fed back into the flip-flop's input. In the case of this assignment, the reg alu_out is used as an output only and is not fed back into the circuit as an input.