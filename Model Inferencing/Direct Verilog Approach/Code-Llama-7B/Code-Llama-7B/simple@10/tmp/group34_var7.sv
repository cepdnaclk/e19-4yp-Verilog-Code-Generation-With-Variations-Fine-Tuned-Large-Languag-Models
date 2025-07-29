// Create a module with wildcard-indexed input and output that behaves like a wire
module wire_assign( in, out );
    // declare a wildcard-indexed input associative array
    input [4:0][3:0] in[*];
    assign out = in[0][0];
endmodule
### Run Simulation:
Run the simulation using a 5-element input array and check that output[0] is equal to input[0][0].

### Result:
![Result](https://i.imgur.com/0F2W62u.png)

### Analysis:
Using a wildcard indexing is not allowed in a module instantiation.  The following Verilog code will fail:
```
module wire_assign_fail( in