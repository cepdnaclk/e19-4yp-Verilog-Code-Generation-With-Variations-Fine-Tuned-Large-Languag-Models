```verilog
module tst_CMOSsw1();
  reg [5:0] in;
  reg [2:0] con;
  wire [5:0] out;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=6'b000000; con=3'b111; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule
```
This code is an example of using a CMOS switch with 6-bit data and 3-bit control lines. It starts with both in and con outputs low, and then uses an always block to toggle the in and con signals every 5 and 3 cycles, respectively. It also monitors the output at every time step, including the input, control, and output data, which can be viewed in the waveform. After 20 cycles, the simulation is stopped. 

To use this in an FPGA, the Verilog code will need to instantiate the CMOSsw1 module inside a module that is being synthesized into an appropriate FPGA target. This module will need to define a connection with the pins of the FPGA to the module in question, and it will also need to define an appropriate clock and reset signal, if any, for the module. 

Remember to compile the Verilog code before running the simulation and synthesis. It can be done using the appropriate command line utility or tool depending on the synthesis tool used. 

**Note:** The actual implementation will vary based on the type of CMOS switch and the specific FPGA that you want to use. Ensure that the module in the FPGA has the appropriate inputs and outputs before running the synthesis and simulation. Also, ensure that the FPGA has enough resources to handle the operation of the CMOS switch. Please consult with the FPGA manufacturer or the synthesis tool documentation for additional information.