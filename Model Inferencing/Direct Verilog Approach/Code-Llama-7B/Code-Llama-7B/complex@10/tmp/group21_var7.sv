module DLatch_behavioral(q, qbar, di, clk);
// Behavioral D-latch with active-high control inputs
output q, qbar;
input di, clk;
wire [1:0] arrslice = 2'b00;
wire [1:0] din_arr = {di};
wire [1:2] din_arrs;
assign din_arrs = din_arr;
assign q = din_arrs inside {arrslice};
assign qbar =!q;
endmodule
### Simulation Results:
### Static Evaluation (`-setup-hold-checks`)
```
$ferror(null) = 0
fatal: [VTV-151] Multiple drivers for net 'Detect_Mealy' at clk.model_tb.top.clk_gen.clk
fatal: [VTV-151] Multiple drivers for net 'Detect_Mealy' at clk.model_tb.top.clk
fatal: [VTV-151] Multiple drivers for net 'Detect_Mealy' at clk.model_tb.top.clk_gen.clk
fatal: [VTV-151] Multiple drivers for net 'Detect_Mealy' at clk.model_tb.top.clk_gen.clk
fatal: [VTV-151] Multiple drivers for net 'Detect_Mealy' at clk.model_tb.top.clk
fatal: [VTV-151] Multiple drivers for net 'Detect_Mealy' at clk.model_tb.top.clk
fatal: [VTV-151] Multiple drivers for net 'Detect_Mealy' at clk.model_tb.top.clk_gen.clk
fatal: [VTV-151] Multiple drivers for net 'Detect_Mealy' at clk.model_tb.top.clk_gen.clk
fatal: [VTV-151] Multiple drivers for net 'Detect_Mealy' at clk.model_tb.top.clk_gen