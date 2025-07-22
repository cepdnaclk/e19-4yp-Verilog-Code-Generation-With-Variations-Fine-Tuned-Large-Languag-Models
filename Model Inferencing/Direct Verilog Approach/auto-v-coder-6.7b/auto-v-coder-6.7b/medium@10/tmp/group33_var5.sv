```verilog
module tst_CMOSsw1();
  reg [3:0] in;
  wire [3:0] out;
  CMOSsw1 cmsw(out,in); // Instantiate CMOS switch
  initial begin
    in=4'b0001;
  end // Start enabled
  always #5 in = in + 1; // Toggle data
  initial $monitor($time, "input = %b, output = %b ",in,out);
  initial #20 $stop; // Stop simulation
  
  // Check if function call result indexed into an array matches a slice range
  wire result;
  initial begin
    if (in == out) begin
      result = 1'b1;
    end
    else begin
      result = 1'b0;
    end
    
    $display("%b == %b is %b", in, out, result);
  end
endmodule
```

The `CMOSsw1` module will take the four-bit input `in` and generate the four-bit output `out`. The code checks every time after 5 time units if the input matches the output. If it does, the `result` will be `1`, else `0`. 

In the final block, a simple `if-else` statement is used to check if the two values are equal. If they are equal, the `result` is set to `1`, else it's set to `0`. 

Finally, a `display` statement is used to print the results.

Please note that the code assumes that you have a `CMOSsw1` module or similar that can perform the switch operation. The `CMOSsw1` module is used as an example and will need to be replaced with your actual switch module. 

Also, this code is assuming a four-bit switch, you might need to adjust the inputs and outputs according to your switch parameters. 

Lastly, the time delays and test stop time in the initial block might need to be adjusted according to your specific test conditions. 

Also, please replace `CMOSsw1` with your actual CMOS switch name.

Please make sure to match your switch module with the Verilog code provided as this