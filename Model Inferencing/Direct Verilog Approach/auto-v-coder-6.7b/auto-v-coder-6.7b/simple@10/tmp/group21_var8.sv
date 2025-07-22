The following code is a slight variation of the original code. It uses the randc/rand keyword to create randomizeable variables.

```verilog
module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
randc bit [1:0] x1, x2, x3, x4; // randc keyword is used for randomized variables.
bit [1:0] g, h; // Declare g and h as bit type

always @* begin // This is a procedural block
    g = (x1 & x3) | (x2 & x4);
    h = (x1 | x3) & (x2 | x4);
    f = g | h;
end
endmodule
```

Just like the rand/randc keyword, the randc/rand keyword applies to variables that are declared in a class, interface, or package. When a class with a randomizable variable is instantiated, the random variable is updated during the randomization process.

The randomized variables are updated continuously during the simulation, and their values can be seen in the waveform viewer.

Remember to instantiate the module with the randomized variables to see the changes.

```verilog
// Instantiation with randomized variables
example4 uut (
   .x1(uut.x1),
   .x2(uut.x2),
   .x3(uut.x3),
   .x4(uut.x4),
   .f(uut.f),
   .g(uut.g),
   .h(uut.h)
);
```

The above instantiation uses randomized variables to connect the module to the testbench. When the testbench is run, the module will have random values for x1, x2, x3, and x4. As a result, the module's g, h, and f outputs will be randomized as well. This is due to design-level randomization, which affects the module's output values.

The module's outputs will be randomly updated each time the testbench is run, making it a useful