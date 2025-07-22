```verilog
module clock_gen_forever_with_func;
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    forever #2 clk = ~clk; // Toggle clock every 2 time units forever
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial
  begin
    $monitor("clk=%b, t=%0d, en=%b, clk_func_val=%b ", clk,$time,en, clk_func());
  end
  function automatic [31:0] clk_func;
    input [31:0] idx;
    integer i;
    clk_func = 0;
    for(i = 0; i < idx; i = i + 1)
    begin
      clk = ~clk;
      #2;
      clk_func = clk;
    end
  endfunction
endmodule
```
In the above code, a function `clk_func` is defined which takes a parameter `idx` representing the number of toggles to be performed starting from clk's initial state. The function toggles the clock and stores the clk's state at each toggle in clk_func. After a number of toggles, it returns the final clk's state. The function is called from inside an initial block. The function is declared as 'automatic' so that it doesn't modify system variables. The `$monitor` statement in the initial block now displays the result of the `clk_func` call alongside other values.

Note: The `clk_func` function was added to demonstrate the use of function and its scope. The actual application of such function would be highly dependent on the specific use case. It's generally not a good practice to generate clock signals in Verilog to avoid issues with state-machine simulation. You should try to generate clock with a hardware description language like VHDL or SystemVerilog that have built-in support for synchronous signals.

Also, take into account the limitations of Verilog (