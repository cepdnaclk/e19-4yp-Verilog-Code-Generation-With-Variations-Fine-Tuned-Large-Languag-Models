module test_multiplier;
reg clk=0, start, error; // Added clk initialization
wire [7:0] databus;
wire lsb_out, msb_