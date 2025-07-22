```verilog
module tst_mup; // Testbench for Microprocessor
reg clk,en,int, BCD_in; // Clock, Enable, Interrupt inputs
localparam BCD_WIDTH = 4;
localparam NUM_BCD_VALS = 10;
localparam BCD_VALS = {4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111, 4'b1000, 4'b1001};

initial begin
// Initialize
BCD_in = 4'b0000;
clk = 1'b0;
en = 1'b0;
int = 1'b0; // Initialize
end

always #2 clk=~clk; // Generate clock

// Monitor clock, time, inputs, and internal MUP registers (pc, ir, dcop)
initial begin
$monitor("clk=%b, t=%0d, en=%b, int=%b, BCD_in=%0b, rr.pc=%0d, rr.ir=%0h, rr.dcop=%0d", clk,$time,en,int, BCD_in, rr.pc,rr.ir,rr.dcop); // Corrected format specifiers
#100 $finish;
end

// mup_opr rr(clk,int,en); // Instantiate DUT

initial begin
#1000 $finish;
end

always @(posedge clk) begin
if ($time <= 100) begin
if (BCD_in == 4'b1001) begin
BCD_in <= #1 4'b0000;
end else begin
BCD_in <= #1 BCD_in + 4'b0001;
end
end else begin
BCD_in <= 4'b1001;