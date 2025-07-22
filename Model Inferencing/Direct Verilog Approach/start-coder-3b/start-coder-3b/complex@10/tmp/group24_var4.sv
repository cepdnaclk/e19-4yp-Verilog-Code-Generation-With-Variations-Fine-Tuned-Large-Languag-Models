#include "verilog_systemc.h"
SC_MODULE(tst_mup)
{
public:
sc_in_clk clk; // Clock
sc_in<bool> en; // Enable
sc_in<bool> int_; // Interrupt request
// Register bcd_in as constant
const unsigned BCD_in = 0;
SC_CTOR(tst_mup)
{
// Instantiate DUT
mup_opr *rr = new mup_opr("rr");
rr->clk(clk);
rr->int_(int_);
rr->en(en);
// Monitor clock, time, inputs, and internal MUP registers (pc, ir, dcop)
SC_METHOD(mon_mup);
sensitive << clk.pos();
dont_initialize();