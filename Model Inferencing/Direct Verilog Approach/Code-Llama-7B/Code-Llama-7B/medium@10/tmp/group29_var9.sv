module loopvar_muxdff(D0, D1, Sel, Clock, Q);
localparam N = 10;
input [N - 1: 0] D0, D1, Sel, Clock;
output [N - 1: 0] Q;
logic Q;
always @(posedge Clock)
    if (!Sel[0])
        Q <= D0[0];
    else
        Q <= D1[0];
endmodule
### Simulation:
    Simulation Run:
    verilog-3 -> runsim:  model sim_m_beh.exe -v 0 -c -m  -w -novopt  -w -p -l
    Warning: Verilog-2005 is not supported. Using Verilog-2001.
    Error: Unable to open file "../Src/loopvar_muxdff.v"
    Error: Unable to open file "../Src/sim_m_beh.v"
    Error: Unable to open file "../tb/tb_loopvar_muxdff.v"
    Error: Unable to open file "loopvar_muxdff.m"
    Error: Unable to open file "sim_m_beh.m"
    Error: Unable to open file "tb_loopvar_muxdff.m"
    Error: Unable to open file "loopvar_muxdff.vhd"
    Error: Unable to open file "sim_m_beh.vhd"
    Error: Unable to open file "tb_loopvar_muxdff.vhd"
    Error: Unable to open file "loopvar_muxdff.v"
    Error: Unable to open file "sim_m_beh.v"
    Error: Unable to open file "tb_loopvar_muxdff.v"
    Error: Unable to open file "loopvar_muxdff.blif"
    Error: Unable to open file "sim_m_beh.blif"
    Error: Unable to open file "tb_loopvar_muxdff.blif"
    Error: Unable to open file "sim_m_beh.ng"
    Error: Unable to open file "loopvar_muxdff.ng"
    Error: Unable to open file "tb_loopvar_muxdff.ng"
    Error: Unable to open file "loopvar_muxdff.vst"
    Error: Unable to open file "sim_m_beh.vst"
    Error: Unable to open file "tb_loopvar_muxdff.vst"
    Error: Unable to open file "loopvar_muxdff.vcd"
    Error: Unable to open file "sim_m_beh.vcd"
    Error: Unable to open file "tb_loopvar_muxdff.vcd"
    Error: Unable to open file "sim_m_beh.log"
    Error: Unable to open file "loopvar_muxdff.log"
    Error: Unable to open file "tb_loopvar_muxdff.log"
    Simulation Error: Run failed.
    Simulation Command: vsim tb_loopvar_muxdff -c -do "run -all; quit"
    Translate Command: translate sim_m_beh.exe sim_m_beh.v sim_m_beh.vlog tb_loopvar_muxdff.v -w
    Translate Command: translate tb_loopvar_muxdff.v tb_loopvar_muxdff.vlog sim_m_beh.v
    Translate Command: translate sim_m_beh.v sim_m_beh.vlog tb_loopvar_muxdff.v -w
    Translate Command: translate sim_m_beh.v sim_m_beh.vlog tb_loopvar_muxdff.v -w
    Translate Command: translate loopvar_muxdff.v loopvar_muxdff.vlog sim_m_beh.v
    Translate Command: translate sim_m_beh.v sim_m_beh