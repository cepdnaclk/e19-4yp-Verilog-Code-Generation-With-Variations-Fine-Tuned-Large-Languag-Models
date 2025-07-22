module verilog_counter(counter);
  reg [63:0] counter;
  initial counter=64;
  always counter = counter +