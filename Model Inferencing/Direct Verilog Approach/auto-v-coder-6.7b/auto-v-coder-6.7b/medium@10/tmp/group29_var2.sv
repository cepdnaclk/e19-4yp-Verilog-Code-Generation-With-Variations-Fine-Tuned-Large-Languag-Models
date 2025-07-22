```verilog
module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule

// Simulation Model
module tb;
reg D0, D1, Sel, Clock;
wire Q;

// DUT
muxdff DUT(.D0(D0),.D1(D1),.Sel(Sel),.Clock(Clock),.Q(Q));

// Simulation
initial begin
  D0 = 0; D1 = 1; Sel = 0;
  // Simulate 10 clock cycles
  repeat(10) begin
    #5 Clock = ~Clock;  // Toggle clock
  end
end

// Print Q after each clock cycle in the simulation model
always @(posedge Clock) begin
  $display("Q = %b", Q);  // Print Q value
end
endmodule
```
In the above code, the original model is used to demonstrate the operation of a D flip-flop with a multiplexer. The DUT (Device Under Test) is instantiated inside a simulation model, where inputs are assigned values and the simulation runs for 10 clock cycles.

The result of the simulation is printed to the console after each clock cycle in the simulation model. The `$display` function is used to print the value of the Q register. 

Please note that the code assumes that a clock signal is toggled with each simulation cycle. If your implementation uses a different method, you might need to adjust the timing or clock signal generation in the code accordingly.

This code can be used as a starting point for testing the functionality of the `muxdff` module with different inputs. Feel free to modify it according to your needs.
#### Note:
The above code should work for any Verilog simulator as long as they support blocking assignments or continuous assignment statements. It's crucial to keep the simulation environment conditions consistent and reproducible to accurately demonstrate the functionality of the `muxdff