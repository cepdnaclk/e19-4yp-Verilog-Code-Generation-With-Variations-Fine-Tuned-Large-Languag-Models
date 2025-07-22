```verilog
module clock_gen_forever;
  reg clk, en;
  // The function to calculate the index
  function automatic integer calculate_index;
    input integer t;
    begin
      calculate_index = t % 10; // Simple modulo operation, changing this will change the frequency of the clock
    end
  endfunction

  always @(posedge en)
    begin
      for (integer i = 0; i < 100; i++) begin // Iteration loop
        #(calculate_index(i+1)) clk = ~clk; // Toggle clock at calculated time
      end
    end
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
```

In this variation, each tick of the clock is determined by the return value of the `calculate_index` function, which varies the frequency of the clock. The function accepts a time unit (t) and calculates the position within a cycle via a modulo operation (`%`), with a return value between 0 and 9. The time unit of the clock is then set according to the returned index.

For example, if `calculate_index` is returning `4` at time `t=1`, the clock will toggle after `4` time units. Every time unit, the `calculate_index` function is called with the next time unit (`t+1`), and the clock toggles accordingly. The loop continues for 100 time units, as the specified condition in the for loop specifies 100 ticks.

This code demonstrates how Verilog can be used to create dynamic clocks, based on the return value of a function.

Note: The function `calculate_index` should be implemented to suit the desired frequency of the clock, based on the application's requirements. In the example, its return value is simply the index in a modulo operation, which means the clock's frequency cycles between every index.

Please substitute the `%` symbol and function with logic that suits your application