module clock_gen_forever_modified;
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    forever #2 clk = ~clk; // Toggle clock every 2 time units forever
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  function calculateIndex;
    @(posedge clk);
    calculateIndex = (calculateIndex+2)%10; // calculateIndex will be incremented on each clock cycle, starting at 0
  endfunction : calculateIndex
  // Use 'calculateIndex' to generate the for loop
  initial
  begin
    @(posedge en) // Start clock generation on posedge en
      for (int i=0; i < 10; i = calculateIndex) // For loop to generate