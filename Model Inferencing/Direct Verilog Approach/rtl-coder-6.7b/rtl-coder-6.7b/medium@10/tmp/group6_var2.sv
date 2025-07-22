module clock_gen_loop_fun; // Renamed module for clarity
  reg clk, en;
  // Generate clock using loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    for (int i=0; i<max_cycles; i=i+1) // Loop'max_cycles' times
      #2 clk = ~clk; // Toggle clock every 2 time units
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
  int max_cycles(); // Function declaration
endmodule

module clock_gen_fun; // Renamed module for clarity
  reg clk, en;
  // Generate clock using loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    for (int i=0; i<max_cycles(); i=i+1) // Loop'max_cycles' times
      #2 clk = ~clk; // Toggle clock every 2 time units
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
  function int max_cycles();
    if ($test$plusargs("max_cycles_func"))
      return 50;
    else
      return 10;
  endfunction
endmodule
### Variation Code:
module clock_gen_loop_forever; // Renamed module for clarity
  reg clk_1, clk_2, en;
  // Generate clock using loop and forever loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    begin
      forever #1 clk_1 = ~clk_1; // Toggle clock every 1 time units forever
      for