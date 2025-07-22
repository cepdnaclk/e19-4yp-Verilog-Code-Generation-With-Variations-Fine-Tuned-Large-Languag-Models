```verilog
module clock_gen_forever; // Renamed module for clarity
  reg clk, en;
  int index;

  function automatic integer index_func;
    input integer time_now;
    index_func = time_now * 1;
  endfunction

  always @(posedge en) // Start clock generation on posedge en
    begin
      for(index=0; index<100; index = index_func($time)) // Loop 100 times
        #2 clk = ~clk; // Toggle clock every 2 time units
    end

  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end

  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
```
This code will generate a clock signal that toggles every 2 time units for 100 times. The `index_func` function is defined to calculate the index value based on the current time. The 'for' loop is used to repeat the code block 100 times. The '#2' delay is used to toggle the clock signal every 2 time units. #2 means wait for 2 time units.

Remember, this can be simplified to something like this:

```verilog
module clock_gen_forever; // Renamed module for clarity
  reg clk, en;

  always @(posedge en) // Start clock generation on posedge en
    for(int i=0; i<100; i++)
        #2 clk = ~clk; // Toggle clock every 2 time units

  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end

  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
```
This code will generate a clock signal that toggles every 2 time units for 100 times, and use a simple for loop to achieve the same result. #2