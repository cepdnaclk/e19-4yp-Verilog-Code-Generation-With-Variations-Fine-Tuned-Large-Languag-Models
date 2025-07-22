```
for (int i = 0; i < 2; i++) {
    boolean result = test_muxdff(i);
    if (result!= 0) {
        System.out.println("PASS");
    }
    else {
        System.out.println("FAIL");
        break;
    }
```    else {
        return 0;
    }
}
```
/src/main/resources/verilog/VerilogModule/README.md
# Verilog module

## Description

Implementation of a module in Verilog. The module is a multiplexer with 2 input signals and 1 output signal, and it uses a single-bit register to store the output. The module is based on a [sequential design](../SequentialDesign/README.md) and uses the [muxdff](../muxdff/README.md) as a basic module.

## File structure

```
.
├── Makefile
├── README.md
├── muxdff_tb.sv
├── testbench.sv
├── testbench_results.txt
├── variables.sv
├── verilog_output.txt
├── module_muxdff.v
└── muxdff.v
```

## Module description

The module implements a muxdff with 2 inputs (D0 and D1) and 1 output signal (Q) that is able to select between the 2 inputs and store the result in an internal register that is clocked by the module's `CLK` input.

## Design structure

The muxdff design is placed inside the `muxdff` module and the module is placed inside a `module_muxdff` module.

![module_muxdff](../module_muxdff.png)

## Testing and verification

The testing and verification of the module is done using the `testbench.sv` file which is based on the `module_muxdff` and uses the `muxdff` module. The tb file also contains the main module with the inputs, outputs and clock.

## Output

The output from the testbench file is:

```
module_muxdff.v:988: $error: Identifier "D0" not declared in this context.
module_muxdff.v:989: $error: Identifier "D1" not declared in this context.
module_muxdff.v:989: $error: Expression of type "Integer" not allowed in module instantiation
module_muxdff.v:990: $error: Expression of type "Integer" not allowed in module instantiation
module_muxdff.v:993: $error: Identifier "Q" not declared in this context.
module_muxdff.v:995: $error: Unreachable code at end of function "test_module_muxdff".
testbench.sv:10: $error: SystemVerilog file "module_muxdff.v" was not compiled
testbench.sv:10: $error: Program aborting at test bench time
```

## Variable file

The [variable](../variables.sv) file contains the module's parameters and the ports.

```
module_muxdff module_muxdff(clk, D0, D1, Sel, Q);
input clk;
input D0, D1, Sel;
output Q;
```

## Module implementation

The module is implemented in the [module_muxdff.v](../module_muxdff.v) file.

```
module module_muxdff(clk, D0, D1, Sel, Q);
input clk, D0, D1, Sel;
output Q;
muxdff muxdff(clk, D0, D1, Sel, Q);
endmodule
```

## Basic module implementation

The [muxdff](../muxdff/README.md) module is implemented inside the module. In order to create the module, it is necessary to include the [variable](../variables.sv) file.

```
module muxdff(clk, D0, D1, Sel, Q);
input clk, D0, D1, Sel;
output Q;
reg D0, D1, Sel, Q;
always @(posedge clk)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule
```

## Testbench implementation

The [testbench](../testbench.sv) file contains the testbench for the [module.sv](../module_muxdff.v) file.

```
`include "variables.sv"
module_muxdff module_muxdff(CLK, D0, D1, Sel, Q);
input CLK, D0, D1, Sel;
output Q;

initial begin
    clk = 1'b0;
    #(1) clk = 1'b1;
end

always @(posedge CLK) begin
    $display("D0: %b, D1: %b, Sel: %b, Q: %b", D0, D1, Sel, Q);
end

initial begin
    #100;
    $finish;
end
endmodule
```

## Makefile

There is a Makefile that contains the necessary commands to compile the verilog file as well as the testbench file in order to test and verify the module.

```
all:
    make run
    make test
    make verify

clean:
    make clean_run
    make clean_test

run:
    iverilog testbench.sv

clean_run:
    rm -f testbench.vvp testbench.vcd

test:
    vvp testbench.vvp > testbench_results.txt

clean_test:
    rm -f testbench.vvp testbench.vcd

verify:
    verilator -Wall testbench.sv
    make -C obj_dir/ -f Vtestbench.mk Vtestbench

clean_verify:
    rm -rf obj_dir
```

## Testbench output

Running the testbench:

![run_tb](../run_tb.png)

Verilog output:

![verilog_output](../verilog_output.png)

The testbench output is:

```
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0, Sel: 0, Q: 0
D0: 0, D1: 0, Sel: 1, Q: 0
D0: 0, D1: 0,