module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r)
out = 1'b0;
else
out = data;
end
endmodule
#### Run Your Testbench

Before you run your testbench, you must update the top-level file. This file must have the name same as the main module name.

For this project, you must edit the top-level test file named DFF_tb.

To update the top-level test file, you need to replace the existing testbench code with the testbench code for the DFF module.

The code below shows the updated top-level test file for the DFF module.

The updated top-level test file DFF_tb.

### Run the Testbench

To simulate the design, you can use any one of the following methods:

• ModelSim
• VCS
• ISE

### ModelSim

To simulate the design using ModelSim, you must install ModelSim and run ModelSim to simulate the design.

To install ModelSim, refer to the ModelSim Installation Guide.

To run ModelSim, click on the Run button on the Design Editor toolbar.

The Design Editor opens.

When you open ModelSim, it creates a workspace and sets it to the workspace directory.

To open the workspace directory, click on File > Workspace. The ModelSim workspace directory opens.

To open the Design Editor, click on File > Open Project. The Project Navigator opens.

To open the testbench file, click on the Testbench File under the workspace directory. The Project Explorer opens.

To open the top-level testbench file, navigate to the Testbench Location and select DFF_tb.

To run the testbench, click on the Run button on the Design Editor toolbar. The Results window opens.

You can see the simulation results on the right side of the window.

You can see the simulation results for the reset signal and the data input.

You can see the simulation results for the output of the DFF.

### VCS

To simulate the design using VCS, you must install VCS and run VCS to simulate the design.

To install VCS, refer to the VCS Installation Guide.

To run VCS, click on the Run button on the Design Editor toolbar.

The Design Editor opens.

When you open VCS, it creates a workspace.

To open the workspace directory, click on File > Workspace. The VCS workspace directory opens.

To open the Design Editor, click on File > Open Project. The Project Explorer opens.

To open the testbench file, click on the Testbench File under the workspace directory. The Project Explorer opens.

To open the top-level testbench file, navigate to the Testbench Location and select DFF_tb.

To run the testbench, click on the Run button on the Design Editor toolbar. The Results window opens.

You can see the simulation results on the right side of the window.

You can see the simulation results for the reset signal and the data input.

You can see the simulation results for the output of the DFF.

### ISE

To simulate the design using ISE, you must install ISE and run ISE to simulate the design.

To install ISE, refer to the ISE Installation Guide.

To run ISE, click on the Run button on the Design Editor toolbar.

The Design Editor opens.

When you open ISE, it creates a workspace.

To open the workspace directory, click on File > Workspace. The ISE workspace directory opens.

To open the Design Editor, click on File > Open Project. The Project Explorer opens.

To open the testbench file, click on the Testbench File under the workspace directory. The Project Explorer opens.

To open the top-level testbench file, navigate to the Testbench Location and select DFF_tb.

To run the testbench, click on the Run button on the Design Editor toolbar. The Results window opens.

You can see the simulation results on the right side of the window.

You can see the simulation results for the reset signal and the data input.

You can see the simulation results for the output of the DFF.

## Lesson Summary

In the previous section, you learned about various design elements.

In this lesson, you learned about the combinational logic element.

You learned about the DFF module.

You learned about the testbench file.

You learned about the main function of the testbench file.