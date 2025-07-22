module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk) do = di ^ clk; // Use non-blocking <= for sequential logic
endmodule
### Results:
Now the design will be realized through a Verilog simulator.

## 4. Simulation:
As we have seen in the previous section, the Verilog simulation tool is called VCS. To start the simulation, the simulator will be invoked in the command line with the following command:
vlog -sv dff.v
The simulator will create the necessary directory to store simulation data. After the simulation is finished, the Verilog simulator will create a file called vcd. The vcd file will include all the data about the simulation. This file can be read by the WaveDVe editor. The following is a screenshot of the WaveDVe editor:

## 5. Conclusion:
In this post, we have walked through the basic Verilog simulation method in the Xilinx Virtual Platform. This method is a handy way for us to get started with the design phase. It is also highly scalable. In the next post, we will talk about the next design method where the flow is in order.