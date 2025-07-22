// Modified module for clarity
module clock_gen_for;
  reg clk, en;
  int index;
  // Generate clock using for loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
  begin
    $monitor("t=%0d ",$time);
    for (index = 0; index < 5; index = index + 1) // 5 time units
      clk = ~clk; // Toggle clock every time unit
  end
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);

endmodule/README.md
# FPGA-Clock-Generation
Verilog code for generating a 100Mhz clock using two different methods to toggle a clock.