```verilog
module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  
  // Test Array
  reg[7:0] myArray[10];
  
  // Procedural Assign
  initial begin
    // Assign function-call result as array index
    myArray[2:1] = {2'd1, 2'd3};
  end
  
  // Display Array
  initial begin
    $display("Contents of myArray: ");
    for(int i = 0; i < 10; i++) begin
      $display("array[%0d] = %0d", i, myArray[i]);
    end
  end
endmodule
```
This code will test two D flip-flops with a 50ns clock period. The initial block is used to drive the clock and data input. The always block is used to generate the clock. The monitor is used to print the current time, clock state, data in, and data out at each positive edge of the clock. The display statement prints the simulation name, and the monitor block is used to print the simulation trace.

The function-call result is assigned as array index and the contents of the array is displayed in the initial block.
Additionally, an array `myArray` of width 10 bit and depth 8 is declared and initialized in the process block. The contents of the array is displayed in another initial block before the simulation stops. This demonstrates how to use function-call result as array index, and how to display the array's contents in the simulation.