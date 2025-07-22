module testbench_inst;
reg Clock;
reg Resetn;
reg Q;
reg [3:0] D;
// Declare testbench signals
reg [3:0] D_tb;

// Instantiate the Unit Under Test (UUT)
dff_inst uut(
.*
);

// Initialize testbench signals
initial begin
Clock = 0;
Resetn = 0;
// Reset the circuit before starting the test
#50 Resetn = 1;
D_tb = 4'b0001;
end

// Clock generator
always #25 Clock = ~Clock;

// Testbench stimulus
always @(posedge Clock) begin
if(Resetn) begin
D_tb = D_tb + 1;
D <= D_tb;
$display("D=%d", D);
end
end
endmodule