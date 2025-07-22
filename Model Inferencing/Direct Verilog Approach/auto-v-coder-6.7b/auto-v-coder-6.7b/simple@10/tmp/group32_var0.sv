```verilog
module Clock_Prog (
    input wire clk,
    input wire [3:0] Resetn
);

always @(posedge clk) begin
    if (!Resetn) begin
        // Reset signal is active low
        // Reset actions...
    end else begin
        // Reset signal is active low
        // Normal operation...
    end
end

endmodule
```

To test this code we should create a testbench module. Below is a basic testbench for this module:

```verilog
module t_Clock_Prog ();
    wire clk;
    wire [3:0] Resetn;

    Clock_Prog M1 (clk, Resetn);

    initial begin
        Resetn = 4'b0000;
        #100 $finish;
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
endmodule
```

In this testbench, we use a four-bit enum for the Resetn input. It can have values 0000 (default case), 1111, 1110, 1100, 1000, etc. Then we modify the Resetn assignment in the initial block to test different enum values.

This code will test the enum coverage of the Resetn input of the `Clock_Prog` module.

Note that this is a simple example. In a real-world scenario, it might be more complex to use enum, especially if dealing with larger state machines or complex designs. It's just for the purpose of testing enum usage in Verilog.

Also keep in mind that `$finish` is not always recommended outside of a testbench because it will stop all simulations at once. Therefore, it's only used here for simplification. If you still want to use `$finish`, you should consider carefully about your use case. If you want to simulate only a certain part of your design or the duration of your simulation, it may be better to use a counter and stop the simulation manually based on the counter value.```verilog
module Clock_Pro