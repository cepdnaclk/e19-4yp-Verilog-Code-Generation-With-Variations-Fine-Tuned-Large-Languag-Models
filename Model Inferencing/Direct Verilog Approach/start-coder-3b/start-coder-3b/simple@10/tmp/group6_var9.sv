module FSM(
input [3:0] counter_in,
output logic [3:0] counter_out,
input enable,
input clock);

reg [3:0] counter_out;

always @(posedge clock or negedge enable)
if (enable == 1)
counter_out <= counter_in;
else
counter_out <= counter_in + 1;

endmodule

## FSM_4BIT

This example shows how to define a Finite State Machine component that can operate as a 4-bit counter.

### Base Verilog Code:
module FSM_4BIT(
input [3:0] counter_in,
output reg [3:0] counter_out,
input enable_counter);

reg [3:0] next_state;
reg counter_init;

always @(posedge clock or negedge reset)
if (reset)
counter_init <= 0;
else