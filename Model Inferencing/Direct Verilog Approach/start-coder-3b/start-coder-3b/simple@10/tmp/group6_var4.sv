module ALU ( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule

### Summary

In a previous section, we saw how to declare a simple combinational signal (a register), assign it a value, and read it in a basic Verilog testbench.

In this section, we will extend our knowledge by implementing a simple arithmetic logic unit (ALU) in combination hardware. The ALU takes two 8-bit inputs, and an add/pass indicator, as well as outputting a 8-bit result.

The ALU is a hardware component that performs basic arithmetic on a set of inputs. Most ALUs will also output a carry if the output results in a non-zero value. The Verilog code below is a simple implementation of an 8-bit ALU.

    module ALU ( input [7:0] a, b, input pass, add,
output reg [7:0] alu_out );

// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule

The Verilog code above is the most basic version of an 8-bit ALU. You will now be tasked with modifying the code above to make the following features of a modern 8-bit ALU work.

• The ALU outputs the result of its computation (and only the result of its computation)
• The ALU can support carry-out

The first two requirements above are trivial to meet. The last requirement will require the introduction of a new component to our chip, which is the register file.

The register file is a collection of 8-bit registers that are accessible via an address select. The register file will be responsible for holding the intermediate values of the ALU.

The Verilog code below is a register file (with 8 8-bit registers). The inputs to the register file are a set of 8-bit data, a set of 2-bit address, a set of 2-bit write enable (we will use this to enable writing to registers), and a set of 1-bit write (we will use this to write to the registers).

    module RegFile(input [7:0] data, input [1:0] a_addr, input [1:0] w_addr, input write,
output reg [7:0] reg_out);

// The first part of the module is the register file itself
reg [7:0] reg [7:0];

// The second part is the write logic
always @(posedge write)
if (w_addr[1]) reg[a_addr[1]] <= reg[a_addr[0]] + data;          // Add a_addr[0] to data
else if (w_addr[0]) reg[a_addr[0]] <= data;                       // Copy data to a_addr[0]
else reg_out = reg[a_addr[0]];                                     // Read from a_addr[0]

endmodule

The Verilog code above is a basic register file implementation. There are two parts to the implementation. The first part is the register file itself. The signal data is copied from the ALU output to the input to the register file when the write enable is 1. The second part is the write logic. The write logic is responsible for writing to the registers. The write logic first checks to see if the write enable signal is enabled for the second address. If it is, then it adds the value at the first address to the data input. If the write enable signal is enabled for the first address, then it copies the data value to the first address. If no write enable is enabled, then the register output is simply the value stored at the first address.

The above code is a basic implementation of a register file with 8 registers. If additional registers are required, you only need to add more registers to the RegFile module by adding more reg [7:0] reg [7:0]; lines. Additionally, you only need to add more address lines to the register file by adding more input [1:0] w_addr, input [1:0] a_addr, to the RegFile module.

## Modifying the ALU to support a modern 8-bit ALU

In the previous section, you learned how to implement a simple 8-bit ALU in Verilog. We will now modify the ALU implementation we created in the previous subsection to meet the requirements of modern hardware.