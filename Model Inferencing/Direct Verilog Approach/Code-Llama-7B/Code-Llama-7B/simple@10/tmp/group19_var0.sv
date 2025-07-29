module tb_dff();
reg [7:0] clk, resetn;
wire [7:0] inst[0:99];
wire [7:0] qe[0:99];
reg [7:0] en;
integer i;
initial begin
    clk = 0;
    resetn = 0;
    en = 0;
    #10 resetn = 1;
end
dff_inst dff_i (inst[0], clk, resetn, qe[0]);
always #(2) clk = ~clk;
always @(posedge clk) begin
    if (en == 1'b1) begin
        for (i = 0; i < 100; i = i + 1) begin
            inst[i] = $random;
        end
        en = 0;
    end
end
always @(posedge clk) begin
    if (en == 1'b1) begin
        $display("%8d %1b %8b %8b %8b", clk, en, inst[0], inst[1], qe[0]);
    end
end
endmodule

### Simulation:

<script src="https://cdnjs.cloudflare.com/ajax/libs/hilight.js/0.12.0/hilight.min.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div id="dff_sim" markdown="1">
```verilog
#10 resetn = 1;
#10 en = 1;
#10 en = 0;
#11 en = 1;
#11 en = 0;
#12 en = 1;
#12 en = 0;
#13 en = 1;
#13 en = 0;
#14 en = 1;
#14 en = 0;
#15 en = 1;
#15 en = 0;
#16 en = 1;
#16 en = 0;
#17 en = 1;
#17 en