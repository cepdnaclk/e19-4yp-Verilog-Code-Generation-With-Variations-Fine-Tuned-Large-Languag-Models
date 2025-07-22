module clock_gen_for_clocks; // Renamed module for clarity
  reg clk, en;
  // Generate clock using for loop, controlled by 'en'
  always @(posedge en)
    for (integer i=0; i<10; i++) // 10x (slow) clock
      #2 clk = ~clk; // Toggle clock
  initial begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=