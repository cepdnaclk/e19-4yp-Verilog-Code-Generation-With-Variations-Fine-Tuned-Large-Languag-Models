```verilog
module tst_CMOSsw1();
  reg [7:0] in;
  wire [3:0] out;
  // Instantiate CMOS switches
  CMOSsw1 cmsw0(out[0],in[0],in[7]);
  CMOSsw1 cmsw1(out[1],in[1],in[7]);
  CMOSsw1 cmsw2(out[2],in[2],in[7]);
  CMOSsw1 cmsw3(out[3],in[3],in[7]);
  initial begin
    in=8'b00000000;
    in[7] = 1'b1;
  end
  always #5 in =~in; // Toggle data bits
  initial $monitor($time, "in = %b, output = %b ",in,out);
  initial #20 $stop; // Stop simulation
endmodule
```
The above code will have 4 CMOS switches, where in the first switch, the control bit is connected to the seventh bit of the data. This means if the control line is enabled (1), the first switch will not be enabled (0), and if the control line is disabled (0), the first switch will be enabled (1). Similarly for the other switches. The module will toggle the data bits every 5 time units, and print the current value of the data and the output of the switches.
### Simulation Result:
The code above will display a series of in/out pairs as the simulation progresses.
### Example:
If you run the simulation with initial conditions and time steps, you will get output of in/out pairs.

For example, with an initial 00000000 as the input, and control (in[7]) is 1, the output of all switches will be 1000. 

If you toggle the data bits and the control line, you will get a change in the output.

Let's say you toggle the data bits one more time, and the control line is 0, the output of all switches will be 0111.

The output of these switches depend on the 8-bit input and the state of the control line.