module tst_dff_pbeh();
  logic di,clk; logic [1:0] do;
  dff_p_logic d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
***
*/

#include "Vdff_p_logic.h"
#include "verilated.h"
#include <iostream>

// Define a macro to allow the use of SystemVerilog types in Verilator
//#define USE_SYSTEM_VERILOG

// Define a macro to allow the use of SystemVerilog types in gcc
//#define USE_GCC_SYSTEM_VERILOG

// Define a macro to allow the use of SystemVerilog types in gcc
//#define USE_GCC_SYSTEM_VERILOG_C_API

// Define a macro to allow the use of SystemVerilog types in gcc
//#define USE_GCC_SYSTEM_VERILOG_C_API_COMPAT_C99

// Define a macro to allow the use of SystemVerilog types in gcc
//#define USE_GCC_SYSTEM_VERILOG_C_API_COMPAT_C99_LEGACY

struct Vdff_p_logic__Syms;

/////////////////////////////////////////////////////////////////////////
///      top-level module instantiation
/////////////////////////////////////////////////////////////////////////

Vdff_p_logic* Vdff_p_logic_factory_pbeh()
{
  Vdff_p_logic* top = new Vdff_p_logic;
  return top;
}

void Vdff_p_logic_delete(Vdff_p_logic* top)
{
  if (!top) return;
  delete top;
}

/////////////////////////////////////////////////////////////////////////
///    top-level module functions
/////////////////////////////////////////////////////////////////////////

Vdff_p_logic::Vdff_p_logic()
: // Module setup
  name2id_(), id2name_(), clock(0), reset(0)
{
  // Module instantiation
//  Vdff_p_logic__Syms* __restrict vlSymsp = get_SimConfig()->symsp.get();
  Vdff_p_logic__Syms* __restrict vlSymsp = (Vdff_p_logic__Syms*)(new Vdff_p_logic__Syms(this, name()) );
  Vdff_p_logic*                __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
  // Initialize Verilog module
  // Internals; generally not touched by application code
  begin();
}

Vdff_p_logic::~Vdff_p_logic()
{
  // Module destruction
  // Deinitialize
  end();
}

void Vdff_p_logic::begin()
{
  VL_DEBUG_IF(VL_DBG_MSGF("+Vdff_p_logic::begin\n"); );
  // INITIAL
  // Initials
  // Initial begin
  // Channel setup
  // Channel initials
//  Vdff_p_logic__Syms* __restrict vlSymsp = get_SimConfig()->symsp.get();
  Vdff_p_logic__Syms* __restrict vlSymsp = (Vdff_p_logic__Syms*)(new Vdff_p_logic__Syms(this, name()) );
  Vdff_p_logic*                __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
  // Body
  {
    // INTERNAL.name_map(12)
    // Tracing: _name_map
    // BEHAVIOUR WHEN BLOCK IS ENTERED
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdff_p_logic::_name_map(12)\n"); );
  }
  // Final
  _final();
  VL_DEBUG_IF(VL_DBG_MSGF("+Vdff_p_logic::end\n"); );
}

void Vdff_p_logic::end()
{
}

void Vdff_p_logic::set_SimConfig(VerilatedConfig* cfg)
{
  if (!cfg) return;
  // USE_SYSTEM_VERILOG
  define_sym2id(cfg->lookup_str("USE_SYSTEM_VERILOG"), 1, __Vm_sym2id);
  // USE_GCC_SYSTEM_VERILOG
  define_sym2id(cfg->lookup_str("USE_GCC_SYSTEM_VERILOG"), 1, __Vm_sym2id);
  // USE_GCC_SYSTEM_VERILOG_C_API
  define_sym2id(cfg->lookup_str("USE_GCC_SYSTEM_VERILOG_C_API"), 1, __Vm_sym2id);
  // USE_GCC_SYSTEM_VERILOG_C_API_COMPAT_C99
  define_sym2id(cfg->lookup_str("USE_GCC_SYSTEM_VERILOG_C_API_COMPAT_C99"), 1, __Vm_sym2id);
  // USE_GCC_SYSTEM_VERILOG_C_API_COMPAT_C99_LEGACY
  define_sym2id(cfg->lookup_str("USE_GCC_SYSTEM_VERILOG_C_API_COMPAT_C99_LEGACY"), 1, __Vm_sym2id);
}

void Vdff_p_logic::define_sym2id(const char* name, int id, SymTab& sym2id)
{
  sym2id.add(name, id, id);
}

void Vdff_p_logic::eval_step()
{
#ifdef TRACE
  if (Verilated::traceActivated())
    trace(dt, 1024);
#endif //TRACE
// Setup time_stamp
// Evaluate reset
// Evaluate clock
// Initialize
// Evaluate set (previous values, as saved by last eval_step()) of clock
    if (0 && (get_SimConfig()->top__Syms->syms->clk_port)) {
        // Evaluate clock(s)
        {
            const bool old = clk;
            if (get_SimConfig()->top__Syms->rst_inv && reset) { clk = old; }
            else if (get_SimConfig()->top__Syms->reset_i) { clk =!old; }
            else { clk =!old; }
            // Evaluate reset
                clock = clk;
        }
    } else {
        // Evaluate clock(s)
        {
            const bool old = clk;
            if (get_SimConfig()->top__Syms->rst_inv && reset) { clk = old; }
            else if (get_SimConfig()->top__Syms->reset_i) { clk =!old; }
            else { clk =!old; }
            // Evaluate reset
                clock = clk;
        }
    }
}

void Vdff_p_logic::eval_reset()
{
// Setup time_stamp
// Reset time_stamp
// Initialize
// Evaluate reset
    reset = 0;
    {
        const bool old = clk;
        const bool old2 = reset;
        if (get_SimConfig()->top__Syms->rst_inv && reset_i) { clk = old; }
        else if (get_SimConfig()->top__Syms->reset_i) { clk =!old; }
        else { clk =!old; }
        reset =!old2;
    }
    // Evaluate clock(s)
        clock = clk;
}


// Verilated::debugDump
void Vdff_p_logic
::_eval_debug_trace_init()
{
  VL_DEBUG_IF(VL_DBG_MSGF("+Vdff_p_logic::_eval_debug_trace_init\n"); );
  // Variables
    Vdff_p_logic__Syms* __restrict vlSymsp = (Vdff_p_logic__Syms*)(this->__VlSymsp);
    Vdff_p_logic*              __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vdff_p_logic
::_eval_debug_trace_dump(VerilatedVcd* vcdp, uint32_t code)
{
  VL_DEBUG_IF(VL_DBG_MSGF("+Vdff_p_logic::_eval_debug_trace_dump\n"); );
  // Variables
    Vdff_p_logic__Syms* __restrict vlSymsp = (Vdff_p_logic__Syms*)(this->__VlSymsp);
    Vdff_p_logic*              __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vdff_p_logic
::_eval_initial_loop()
{
  VL_DEBUG_IF(VL_DBG_MSGF("+Vdff_p_logic::_eval_initial_loop\n"); );

}

void Vdff_p_logic