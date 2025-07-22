```verilog
module addern(carryin, X, Y, S, carryout);
parameter n = 16;
input carryin;
input [n-1:0] X, Y;
output [n-1:0] S;
output carryout;
reg [n-1:0] S;
reg [n:0] C;
reg carryout;
integer k;
always @(X or Y or carryin)
begin
    C[0] = carryin;
    for (k = 0; k <= n-1; k = k + 1)
    begin
        S[k] = X[k] ^ Y[k] ^ C[k];
        C[k+1] = (X[k] & Y[k]) | (C[k] & X[k]) | (C[k] & Y[k]);
    end
    carryout = C[n];
end
endmodule
```
### Result:
```
## Synthesis
## Running: symbiflow_synth -d klayout -s xilinx_sky130_fd_sc_hd -p xc7a50t-clg400-1 -v synth_run.v
## Found: xc7a50t-clg400-1
## Using default set_io_delay_on_comb_tree 0
## Using default set_max_fanout_on_comb_tree 0
## Found: xilinx_sky130_fd_sc_hd
[synth] Reading XFCE config file from "/home/michael/Documents/GitHub/FPGA/P1/P1_FPGA/xilinx/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.cfg"
[synth] Writing XFCE file to work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.xfce
[synth] Creating input/output file work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.io.txt
[synth] 263992
[synth] Writing IO file to work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.io.txt
[synth] Writing IO file to work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.io.txt
[synth] Removing IO file work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.io.txt
[synth] Running netgen -l work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.netgen.log.txt -n work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.netgen.txt -p xc7a50t-clg400-1 -d xc7a50t_8_lx150t_1p0_16_nm.xc7a50t -b xc7a50t -c ffe -s work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.spice.log.txt -t work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.spice.txt -r work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.lef.log.txt -u work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.lef.txt -m work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.mag.log.txt -i work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.mag.txt
[synth] Reading LEF file from /home/michael/Documents/GitHub/FPGA/P1/P1_FPGA/xilinx/.xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.lef
[synth] Creating LEF file to work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.lef
[synth] Writing LEF file to work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.lef
[synth] Running lse
[synth] Reading netgen file from work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.netgen.log.txt
[synth] Writing netgen file to work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.netgen.log.txt
[synth] Running lse
[synth] Reading netgen file from work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.netgen.log.txt
[synth] Reading FFE file from /home/michael/Documents/GitHub/FPGA/P1/P1_FPGA/xilinx/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.spice.txt
[synth] Writing netgen file to work/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.spice.txt
[synth] Reading FFE file from /home/michael/Documents/GitHub/FPGA/P1/P1_FPGA/xilinx/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.spice.txt
[synth] Writing FFE file to /home/michael/Documents/GitHub/FPGA/P1/P1_FPGA/xilinx/xc7a50t-clg400-1_xc7a50t_8_lx150t_1p0_16_nm.xc7a50t.ffe.spice.txt
[synth] Running lse
[synth] Reading LEF file from /home/michael/Documents/GitHub/FPGA/P1