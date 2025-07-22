```verilog
// Create a module with one input and one output that behaves like a wire
module wire_assign( input wire in, output wire out );
    // assign out to in
    assign out = in;
endmodule
```

### Testbench Code:

```verilog
// Testbench for the wire_assign module
module tb_wire_assign();
    // Declare the inputs and outputs of the module
    reg in;
    wire out;
    
    // Instantiate the module
    wire_assign uut(
       .in(in),
       .out(out)
    );
    
    // Start the test
    initial begin
        // Set the values of the inputs
        in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        
        // Stop the test after 40ns
        $finish;
    end
    
    // Display the outputs
    always @(*) begin
        $display("t = %t, in = %b, out = %b", $time, in, out);
    end
endmodule
```

In this testbench, we are firstly declaring the inputs `in` and the output `out`, then instantiating the `wire_assign` module. Afterwards, we are using the `initial` block to set the value of `in` over time and finally display the values of `in` and `out`. When `t = 0` and `in = 0`, `out` also equals `0`. As `t` goes positive, `in` increments, and the value `out` also increases. This demonstrates that the `wire_assign` module behaves like a wire.

The `$finish` command is used to stop the simulation after a specified amount of time. In this case, the simulation will end after 40ns.

When run, this testbench should output the values of `in` and `out` as the simulation progresses. This includes the delay between setting the value of `in`. The initial delay of 10ns occurs before the first `in` value is set, and the remaining delays (10ns apart) represent the simulation time progressing.