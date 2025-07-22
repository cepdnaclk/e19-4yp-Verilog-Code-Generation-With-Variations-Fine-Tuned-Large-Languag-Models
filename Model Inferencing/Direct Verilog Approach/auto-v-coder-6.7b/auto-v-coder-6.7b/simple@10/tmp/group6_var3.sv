```verilog
module ALU ( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
```
This change will ensure that the ALU module outputs a binary number, as required. 

Please note that the type of output signal (logic vs reg) can depend on the specific needs of the design, including the specific Verilog standard being used, whether the output signal is used as a register or combinational logic, etc. 

The ALU output should be binary as it must be capable of representing the result of a binary addition operation. The Verilog standard (1364-2001) allows output signals to be declared with any of the data types (logic, reg, integer, real, time), in this case, we used logic [7:0]. However, the specific design requirements might dictate different types of output signals. Be mindful of this when deciding on the output type. 

Remember that the use of the reg type in Verilog is generally discouraged in favor of the logic type due to its better compatibility with tools and synthesis tools. So, it’s generally recommended to use the logic type in place of reg for output signals in Verilog.

In modern synthesis tools like Xilinx Vivado, it’s considered good practice to use the logic type for output signals to promote good synthesis results. Also, the logic type carries more information about the type of signals and hence helps with code verification and readability. 

The use of the reg type in Verilog is typically discouraged for output signals due to issues with timing and simulation, as reg-type signals in SystemVerilog does not have equivalent in Xilinx Vivado. However, this specific example does not have any such issues, so the use of reg type for output signals may be a valid choice in some specific cases, but it's generally recommended to use logic for output signals in Verilog/SystemVeril