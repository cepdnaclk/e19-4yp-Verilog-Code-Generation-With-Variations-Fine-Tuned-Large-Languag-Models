```verilog
add_4(data[3],data[2],data[1],data[0]);
```

### Modified Verilog Code:

```verilog
addern(data[3],data[2],data[1],data[0]);
```

In general, a single variability is not possible in the current implementation of the tool. If you need it, please create a feature request.

### References

- [A tool for optimizing and verifying modular implementations](http://www.cse.scu.edu/~ericli/papers/iccad2005.pdf)
/docs/user_guide/tutorials/tutorial_6.md
---
layout: default
title: Tutorial 6: Design Verification
parent: Tutorials
grand_parent: User Guide
---

# Tutorial 6: Design Verification

In this tutorial, we will see how to verify our testbench design using modelsim.

## Problem Description

We have completed all the previous steps of this tutorial. Now, we will add verification steps to our circuit design.

## Design Verification

The first step in testing a module is to simulate the circuit. This step is required because verification tools evaluate the behavior of the circuit by comparing it to a reference case. Modelsim is a simulation tool that allows us to simulate the circuits in a testbench. The testbench is a module that connects a series of module instances. In the above circuit, we are connecting an input `a`, an input `b`, and an output `sum` using the testbench `tb`.

{% capture summary %}
![img](/user_guide/tutorials/images/tut6/tut6-4.png)
{% endcapture %}
{% include image.html summary=summary width="100%" file="tut6-4.png" %}

```verilog
tb: module tb(a, b, clk, sum, rst);
  reg [3:0] a;
  reg [3:0] b;
  reg clk;
  reg rst;
  reg [3:0] sum;
  wire [3:0] sum2;
  assign sum2 = a + b;
  add_4 add(a, b, clk, rst, sum);
  add_4 add2(sum, sum2);
  assign sum = add2.S;
  assign sum2 = add2.S;

  integer i;

  initial
  begin
    rst = 1'b0;
    clk = 1;
    #5 clk = 0;
    $dumpfile("tb_dump.vcd");
    $dumpvars(0, tb);

    for (i = 0; i < 16; i = i + 1)
    begin
      a = [i:0];
      b = [i:0];
      #10 clk = ~clk;
    end

    $finish;
  end

endmodule
```

When `tb` is run, we are setting the value of `a`, `b`, and `sum` to the values of `i` (0 to 15 in hex) in order to test all possible combinations of the inputs. We use the `$dumpvars` command to dump the values of `a`, `b`, `sum`, and `clk` to `tb_dump.vcd`.

Now that we have a testbench, we need to add a top level module to test the testbench design. The top level module needs to be connected to the inputs of the testbench module. The top level module should be able to run the testbench module. Now that we have a working testbench, we can simulate it and verify that the output values match the reference values.

{% capture summary %}
![img](/user_guide/tutorials/images/tut6/tut6-1.png)
{% endcapture %}
{% include image.html summary=summary width="100%" file="tut6-1.png" %}

```verilog
module tba;
  reg clk;
  reg reset;
  wire [3:0] a;
  wire [3:0] b;
  wire [3:0] sum;
  wire [3:0] sum2;
  tb tb(a, b, clk, sum, reset);
  initial begin
    clk = 1;
    #5 clk = 1;
    $dumpfile("tb_dump.vcd");
    $dumpvars(0, tb);
  end
endmodule
```

In the above code, we are connecting all the inputs of the testbench to `a`, `b`, `sum`, and `clk`. We are also using the command `$dumpvars` to dump the values of `a`, `b`, `sum`, and `clk` to `tb_dump.vcd`.

The last step is to run the top level module and use the waveform viewer to verify the output. It will be verified that the output is correct by comparing each input to its reference case.

{% capture summary %}
![img](/user_guide/tutorials/images/tut6/tut6-2.png)
{% endcapture %}
{% include image.html summary=summary width="100%" file="tut6-2.png" %}

```verilog
vvp -m./work.v -n tb./work.v +tb_dump.vcd
```

In the above code, we are using the `vvp` command to load the testbench module and the top level module into modelsim. We are also using the command `+tb_dump.vcd` to load the dump file we generated earlier.

To view the waveforms generated in a waveform viewer, we use the command `vvp`. Modelsim uses the waveform viewer to generate waveforms of the design. The command `vvp` is used to view the waveforms generated in the waveform viewer.

## Summary

In this tutorial, we learned how to perform a design verification. We learned how to simulate the design using modelsim and verified the reference case.

## Next Steps

[Tutorial 7: Design Synthesis](./tutorial_7.html)

## References

- [Introduction to Modelsim User Guide](http://www.cadence.com/content/dam/cadence/documentation/modelsim/10.5/UG_ModelSim_10.5.pdf)
- [Introduction to RTL Design](https://www.cadence.com/content/dam/cadence/solutions/design-services/industries/system-verilog-design-guide/introduction-to-rtl-design.pdf)
- [How to write a Verilog simulation testbench](https://www.cadence.com/content/dam/cadence/technical_advances/how_to_write_a_verilog_simulation_testbench.pdf)/docs/user_guide/tutorials/tutorial_8.md
---
layout: default
title: Tutorial 8: Design Synthesis
parent: Tutorials
grand_parent: User Guide
---

# Tutorial 8: Design Synthesis

In this tutorial, we will see how to synthesize our design using `verilator`.

## Problem Description

We have completed all the previous steps of this tutorial. Now we will add synthesis steps to our circuit design.

## Design Synthesis

There are two synthesis tools that work with Verilog. `verilator` is a tool that will generate Verilog code for simulation as well as a C++ simulator. The `verilator` synthesis tool is a bit difficult to use because it requires many commands to be entered. It also requires a number of files to be generated.

`yosys` is a tool that will do pre processing of the verilog code before synthesis. The `yosys` pre-processor works in a very similar way as `verilator`.

To create a synthesis tool, there are steps that need to be performed. The first step is to create a `Makefile`. The `Makefile` is a file that contains instructions to build and compile the project. Next, we will create a `Makefile` for `verilator`. The second step is to create a `main.cpp` file that contains the main() function of the C++ simulator and a `add_4.cpp` file that contains the Verilog code.

The `Makefile` and `main.cpp` must be created in the same directory as the Verilog files. The `add_4.cpp` file needs to be in another directory. `verilator` does not support a single source file. We will have two source files.

Here is our Makefile:

```make
VERILATOR_ROOT=/home/user/verilator-4.110

VERILATOR_CXXFLAGS +=   \
    -I. \
    -I$(VERILATOR_ROOT)/include \
    -I$(VERILATOR_ROOT)/include/vltstd \
    -I$(VERILATOR_ROOT)/include/verilated \
    -DVL_USER_DEFINED_COSIM_CONFIG \
    -DVL_RAND_RESET \
    -DVL_DEBUG \
    -DVCD_DUMP

VERILATOR_LDFLAGS +=    \
    -L$(VERILATOR_ROOT)/lib-linux \
    -