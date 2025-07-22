```verilog
module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
always #7 en=~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units

localparam s_cnt = {1'b1, 1'b0, 1'b1, 1'b0};

`ifdef VERILATOR
generate
    if (s_cnt[2]) begin
        always @(posedge di or negedge en) begin
            #5;
            // Some combinational logic
        end
    end
`endif

initial
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation
endmodule
```
Please note that there are some limitations with Verilator as it does not support SystemVerilog constructs like generate ifdef. This example will work as-is with other tooling like ModelSim, Icarus Verilog or other Verilog simulators.

Also, you might need to adjust the timing or the conditions for the `always` block depending on your design requirements. This code is a suggestion and may need adjustments based on your specific design requirements.