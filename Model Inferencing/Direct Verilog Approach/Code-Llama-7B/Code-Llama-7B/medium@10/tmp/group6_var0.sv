module clock_gen_for; // Renamed module for clarity
  reg clk, en;
  // Generate clock using for loop controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    for (integer i = 0; i < 5; i++)
      #2 clk = ~clk; // Toggle clock every 2 time units forever
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
### Explanation:
The expression <code>#2 clk = ~clk</code> inside the 'for' loop performs the actual toggling of the clock. If we want to display this value of the clock, we need a $display statement. This $display statement should display the current value of the clock and the time value (in time units) when the clock is toggled. The expression <code>$time</code> gives the current time value in 100ps units when it is evaluated.
### Simulation:
![](Simulation/ClockGen1.JPG)


### Task 4:
### Base Verilog code:
module clock_gen_while; // Renamed module for clarity
  reg clk, en;
  // Generate clock using for loop controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    while (i < 5) begin
      #2 clk = ~clk; // Toggle clock every 2 time units forever
      i++;
    end
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
  integer i = 0;
endmodule
### Variation