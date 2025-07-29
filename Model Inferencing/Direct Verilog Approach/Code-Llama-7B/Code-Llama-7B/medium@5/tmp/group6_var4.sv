module clock_gen_forever; // Renamed module for clarity
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    begin
      // for loop with inside expression for index
      for(int i = 0; i < 4; i = inside_expression()) // Condition for exiting loop
        clk = ~clk; // Toggle clock every 2 time units forever
    end
  // Function used to calculate index in for loop
  function int inside_expression();
    return 3-3; // This will force the index to never change
    #2; // This delay gives the loop forever time to exit
  endfunction
  initial
  begin
    clk