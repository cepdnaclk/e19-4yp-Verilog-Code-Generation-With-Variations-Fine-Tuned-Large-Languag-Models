#ifdef STRUCTURAL_GRANULARITY
typedef struct {
logic [31:0] field;
} Result;
#else
typedef logic [31:0] Result;
#endif
module netdelay1(x,y);
input x;
output Result y;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign y.field=nn; // Assign 'nn' to 'y' (direct assignment)
endmodule
### Verilog Testbench:
`timescale 1ns / 1ps

`include "uvm_macros.svh"

`include "interfaces.vh"
`include "monitor.svh"
`include "sequence_item.svh"
`include "sequencer.svh"
`include "driver.svh"
`include "agent.svh"
`include "scoreboard.svh"
`include "env.svh"
`include "test_lib.svh"
`include "test.svh"

//`define STRUCTURAL_GRANULARITY  // Comment this line to test bit level granularity

module netdelay_tb;

bit clk;
bit rst;

always #5 clk = ~clk;


netdelay dut(.clk,.rst,
`ifdef STRUCTURAL_GRANULARITY
.Result(result_struct)
`else
.Result(result_bit)
`endif
);

// Instantiate interfaces, agents, scoreboard

//Interface
interfaces #(`STRUCTURAL_GRANULARITY) if_0(clk);

//Agent
agent #(`STRUCTURAL_GRANULARITY) agent_0(if_0);

//Scoreboard
scoreboard #(`STRUCTURAL_GRANULARITY) sb_0(if_0);

//Environment
env #(`STRUCTURAL_GRANULARITY) env_0(agent_0, sb_0);

//Test
test #(`STRUCTURAL_GRANULARITY) test_0(env_0);

//Variable declarations

`ifdef STRUCTURAL_GRANULARITY
bit [31:0] result_struct;
`else
bit [31:0] result_bit;
`endif

// UVM run_test macro
initial begin
uvm_config_db#(virtual interfaces #(`STRUCTURAL_GRANULARITY))::set(null, "*", "if_0", if_0);

run_test();
$finish;
end

initial begin
rst = 1;
#30;
rst = 0;
end

initial begin
$dumpfile("dump.vcd");
$dumpvars;
end


endmodule

### 1. What is the difference between this and the previous test bench?
### 2. What is the value of the output at time t=15 after 0?
### 3. What is the value of the output at time t=15 after reset(rst=1)?
### 4. What is the value of the output at time t=20 after 0?
### 5. What is the value of the output at time t=20 after reset(rst=1)?
### 6. What is the value of the output at time t=25 after 0?