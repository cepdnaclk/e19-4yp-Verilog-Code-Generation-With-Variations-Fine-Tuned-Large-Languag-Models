//...
//...
always @*
begin
    if (data_ready && state!= 0)
    begin
        case (state)
            0: dut.maj3_p_0(tmp, a, b, c, out_maj3);
            1: dut.maj3_p_1(tmp, a, b, c, out_maj3);
            2: dut.maj3_p_2(tmp, a, b, c, out_maj3);
            3: dut.maj3_p_3(tmp, a, b, c, out_maj3);
            4: dut.maj3_p_4(tmp, a, b, c, out_maj3);
            5: dut.maj3_p_5(tmp, a, b, c, out_maj3);
            6: dut.maj3_p_6(tmp, a, b, c, out_maj3);
            7: dut.maj3_p_7(tmp, a, b, c, out_maj3);
        endcase
    end
end
`

## 3. Output
The simulation run output:
<img src="https://github.com/sanchitgandhi/FPGA-Final-Project/blob/master/Images/simulation_output.png" align="center">
/Project/Code/tb/verilog/testbench/testbench.cpp
#include <iostream>
#include <stdio.h>
#include "verilated.h"
#include "Vtestbench.h"
#include "Vmaj3_p.h"

using namespace std;

#include <stdint.h>

static uint64_t sc_time_stamp(void) {
    // This function returns the core time in "units of time
    // resolution" e.g. 1 ps = 1
    return (uint64_t) vlSimulationTime;
}

static int sim_time_ps(void) {
    // This function returns the current simulated time
    // in ps (1ps = 1)
    return sc_time_stamp() / 2;
}

bool next_state(uint8_t& next_state, uint8_t& state)
{
    state = next_state;
    return true;
}

int main(int argc, char** argv, char** env) {
    Verilated::commandArgs(argc, argv);
    Vtestbench *tb = new Vtestbench;
    Vmaj3_p* maj3_p = new Vmaj3_p;

    bool data_ready = false;
    tb->clk = 0;
    tb->data_ready = data_ready;
    tb->a = 0;
    tb->b = 0;
    tb->c = 0;
    tb->rst = 1;

    Vtestbench* tb2 = new Vtestbench;
    Vmaj3_p* maj3_p2 = new Vmaj3_p;

    maj3_p->maj3_p_i_a(0);
    maj3_p->maj3_p_i_b(0);
    maj3_p->maj3_p_i_c(0);
    maj3_p->maj3_p_o_out(0);

    maj3_p2->maj3_p_i_a(0);
    maj3_p2->maj3_p_i_b(0);
    maj3_p2->maj3_p_i_c(0);
    maj3_p2->maj3_p_o_out(0);

    uint8_t state = 0;
    uint8_t state2 = 0;
    uint8_t next_state = 0;
    uint8_t next_state2 = 0;
    uint8_t tmp = 0;
    uint8_t tmp2 = 0;
    uint8_t out_maj3 = 0;
    uint8_t out_maj3_2 = 0;

    while (true) {
        if (tb->clk == 0) {
            tb->clk = 1;
            data_ready = true;
        } else {
            tb->clk = 0;
            data_ready = false;
        }

        tb->eval();
        tb2->eval();
        maj3_p->eval();
        maj3_p2->eval();

        if (sim_time_ps() >= 200) {
            if (state == 0) {
                tb->a = 1;
                tb->b = 0;
                tb->c = 1;
            } else if (state == 1) {
                tb->a = 0;
                tb->b = 1;
                tb->c = 1;
            } else if (state == 2) {
                tb->a = 1;
                tb->b = 1;
                tb->c = 1;
            } else if (state == 3) {
                tb->a = 0;
                tb->b = 0;
                tb->c = 1;
            } else if (state == 4) {
                tb->a = 1;
                tb->b = 1;
                tb->c = 0;
            } else if (state == 5) {
                tb->a = 1;
                tb->b = 0;
                tb->c = 0;
            } else if (state == 6) {
                tb->a = 0;
                tb->b = 1;
                tb->c = 0;
            } else if (state == 7) {
                tb->a = 0;
                tb->b = 0;
                tb->c = 0;
            }

            if (state2 == 0) {
                tb2->a = 1;
                tb2->b = 0;
                tb2->c = 1;
            } else if (state2 == 1) {
                tb2->a = 0;
                tb2->b = 1;
                tb2->c = 1;
            } else if (state2 == 2) {
                tb2->a = 1;
                tb2->b = 1;
                tb2->c = 1;
            } else if (state2 == 3) {
                tb2->a = 0;
                tb2->b = 0;
                tb2->c = 1;
            } else if (state2 == 4) {
                tb2->a = 1;
                tb2->b = 1;
                tb2->c = 0;
            } else if (state2 == 5) {
                tb2->a = 1;
                tb2->b = 0;
                tb2->c = 0;
            } else if (state2 == 6) {
                tb2->a = 0;
                tb2->b = 1;
                tb2->c = 0;
            } else if (state2 == 7) {
                tb2->a = 0;
                tb2->b = 0;
                tb2->c = 0;
            }

            maj3_p->maj3_p_i_a(tb->a);
            maj3_p->maj3_p_i_b(tb->b);
            maj3_p->maj3_p_i_c(tb->c);

            maj3_p->maj3_p_o_out(out_maj3);

            maj3_p2->maj3_p_i_a(tb2->a);
            maj3_p2->maj3_p_i_b(tb2->b);
            maj3_p2->maj3_p_i_c(tb2->c);

            maj3_p2->maj3_p_o_out(out_maj3_2);

            next_state = state + 1;
            next_state = next_state >= 8? 0 : next_state;
            next_state2 = state2 + 1;
            next_state2 = next_state2 >= 8? 0 : next_state2;
            tmp = out_maj3;
            tmp2 = out_maj3_2;

            cout << "STATE: " << state << endl;
            cout << "STATE2: " << state2 << endl;

            cout << "A: " << tb->a << endl;
            cout << "B: " << tb->b << endl;
            cout << "C: " << tb->c << endl;

            cout << "A: " << tb2->a << endl;
            cout << "B: " << tb2->b << endl;
            cout << "C: " << tb2->c << endl;

            cout << "OUT MAJ3: " << out_maj3 << endl;
            cout << "OUT MAJ3_2: " << out_maj3_2 << endl;

            cout << "NEXT STATE: " << next_state << endl;
            cout << "NEXT STATE 2: " << next_state2 << endl;
            cout << "TMP: " << tmp << endl;
            cout << "