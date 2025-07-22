module dff_tb();
// Inputs
bit Clk, Reset;
bit [31:0] D, Q;

// Outputs
// Instantiate the Unit Under Test (UUT)
dff_inst uut (
.D(D),
.Clock(Clk),
.Resetn(Reset),
.Q(Q)
);

initial begin
// Initialize Inputs
Clk = 0;
Reset = 1;

// Reset
#100;
Reset = 0;

// Write
D = 32'h0000A5A5;
#100;
D = 32'h0000B6B6;
#100;
D = 32'h0000C7C7;