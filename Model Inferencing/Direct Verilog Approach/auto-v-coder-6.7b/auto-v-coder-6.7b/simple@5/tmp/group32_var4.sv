```verilog
`timescale 1ns/1ns

module enum_test;
    enum {NON_DEFAULT, DEFAULT} state;

    reg clk;
    initial clk = 1'b1;
    always #5 clk = ~clk;

    initial begin
        // Initialize state
        state = NON_DEFAULT;
        #200;
        $finish;
    end

    initial begin
        $dumpfile("enum_test.vcd");
        $dumpvars(1, enum_test);
        $display("Start of Simulation");
        #200;
        $display("End of Simulation");
    end

    // Output the state
    initial begin
        forever begin
            #10 $display("state = %0d", state);
        end
    end

endmodule
```

In this code, the `enum` is used to define a signal that can be in two states - `NON_DEFAULT` and `DEFAULT`. This is then used in the state transition in the initial block of the module. The enum variables are declared as reg type in the Icarus Verilog simulation, and so are used as the inputs to the module. This code sets up a simple clock and state based on the clock.

The `$display` statements are used to print the state of the enum during the simulation. The `$finish` directive is used to end the simulation after a certain time.

Please note: To use the enum test in the Icarus Verilog simulator, you need to compile the code with the `-g2012` flag. This will enable coverage for enum variables. 

To compile with Icarus Verilog:
```
iverilog -g2012 enum_test.v
```
To run the simulation:
```
vvp a.out
```
This will simulate the enum_test module and display the state of the enum variable `state`. If you have a simulator that doesn't support `-g2012`, you can use `-g` to specify the version of verilog being used, such as for Icarus Verilog:
```
iverilog -g2001 enum_test.