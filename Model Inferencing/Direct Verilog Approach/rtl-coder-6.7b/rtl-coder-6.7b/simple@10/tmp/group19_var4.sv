module testbench_dff ();
// Inputs
reg Clock, Resetn, D;

// Outputs
wire Q;

// Instantiate the Unit Under Test (UUT)
dff_inst uut (
.D(D), 
.Clock(Clock), 
.Resetn(Resetn), 
.Q(Q)
);

// Clock process definitions
initial
begin
Clock = 1'b0;
forever #100 Clock = ~Clock;
end

// Stimulus process
initial
begin
// Initialize Inputs
Resetn = 1'b1;
D = 1'b0;
// Wait 100 ns for global reset to finish
#100;
// Add stimulus here
#1000 
D = 1'b1;
#100
D = 1'b0;
#100
D = 1'b1;
#100
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
#100;
D = 1'b0;
end
endmodule
### Verification and