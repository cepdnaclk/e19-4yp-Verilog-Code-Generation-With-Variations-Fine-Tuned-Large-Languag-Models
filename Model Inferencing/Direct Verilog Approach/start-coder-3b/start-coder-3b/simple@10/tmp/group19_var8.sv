module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;
int num_inputs = sizeof(inputs) / sizeof(inputs[0]);
int random_number = 0;
for (int i = 0; i < num_inputs; i += 1) {
random_number = rand();
}
endmodule
### Expected outputs:
The testbench should run in a loop and generate random inputs.

## 1.8 Tips

### Tips 1.1

Testbench file (main.sv)

module main;
`include "testbench.sv"
endmodule

Testbench (testbench.sv)

module testbench;
reg     clk;
wire    rst;
wire    test_module;

dff_inst tb (
.D(test_module),
.clk(clk),
.rst(rst)
);

initial begin
#5 clk = ~clk;
end

initial begin
#10 rst = 1'b1;
#30 rst = 1'b0;
end

endmodule

### Tips 1.2

Testbench file (testbench.sv)

`include "dff_inst.sv"

dff_inst test_module(
.D(1'b1),
.clk(clk),
.rst(rst)
);

### Tips 1.3

Testbench file (testbench.sv)

`include "dff_inst.sv"

dff_inst tb(
.D(1'b1),
.clk(clk),
.rst(rst)
);

### Tips 1.4

Testbench file (testbench.sv)

`include "dff_inst.sv"

dff_inst tb(
.D(1'b0),
.clk(clk),
.rst(rst)
);

### Tips 1.5

Testbench file (testbench.sv)

`include "dff_inst.sv"

dff_inst tb(
.D(1'bn1),
.clk(clk),
.rst(rst)
);

## 1.9 Summary

• The DFF module is a simple combinational module that has a single input and single output.
• The DFF is a module to create a dynamic number of DFFs in a testbench.
• The input signals can be used to generate a random number for each dynamic DFF.
• The random number can be used to change the DFF data input.
• The testbench should be modified to allow multiple inputs and multiple outputs to be created based on a list of inputs.

## 1.10 References

• [1] Moore,. (2014). Verilog HDL: A Hardware Description Language. Pearson Higher Education.