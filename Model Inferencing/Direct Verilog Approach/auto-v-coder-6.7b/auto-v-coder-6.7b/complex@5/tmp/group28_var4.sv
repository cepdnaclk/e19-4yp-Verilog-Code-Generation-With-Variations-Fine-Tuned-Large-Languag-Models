```verilog
// Package defining the state types and their packed values
package cpu_types;
    typedef enum bit[1:0] {IDLE, READY, EXEC} state_t;
    localparam state_t IDLE_VAL = 2'b00, READY_VAL = 2'b01, EXEC_VAL = 2'b10;
endpackage

// Use the cpu_types defined above
import cpu_types::*;

// Module implementing the D latch
module dlatch (en, d, q, qb);
    input en, d;
    output reg q, qb;
    always @(*) begin
        if (en) begin
            q = d;
            qb = ~d;
        end
    end
endmodule

// top level module for testing
module tstdlatch;
    reg d, en;
    wire q, qb;
    dlatch ff (en, d, q, qb);
    
    //initializing
    initial begin
        d = 1'b0;
        en = 1'b0; // latch disabled
    end
    
    // Toggle enable every 4 time units
    always #4 en = ~en;
    
    // Toggle data every 8 time units
    always #8 d = ~d;
    
    // Printing the values at each simulation step
    initial begin
        $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en, d, q, qb);
    end
    
    // Simulation stops after 40 time units
    initial begin
        #40 $stop;
    end
endmodule
```

Please note that the testbench doesn't depend on the `cpu_types` package in any other modules or packages. This is just an example of how you might decouple the types and values from the logic in the modules. It's good practice to define enumerations and packed ranges in separate packages for reusability and to avoid circular dependencies. In this example, we define the `cpu_types` package and import its types into our `tstdlatch` module. The `dlatch