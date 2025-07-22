enum {AND, OR, XOR} op;
### Modified Testbench:
logic [23:0] in, out[3];
strength strength (in[2:0], in[8:6], out[0], out[2]);
strength strength (in[2:0], in[8:6], op, out[1]);
### Modified Constraint Script:
create_clock -name clk -period 10 [get_ports clk];
set_input_delay 5 -max -clock clk [get_ports {a, c}];
set_output_delay 5 -max -clock clk [get_ports {zn, zp}];
set_input_delay 5 -min -clock clk [get_ports {a, c}];
set_output_delay 5 -min -clock clk [get_ports {zn, zp}];
### Modified Constraint Script (enum):
create_clock -name clk -period 10 [get_ports clk];
set_input_delay 5 -max -clock clk [get_ports {a, c}];
set_output_delay 5 -max -clock clk [get_ports {zn, zp}];
set_input_delay 5 -min -clock clk [get_ports {a, c}];
set_output_delay 5 -min -clock clk [get_ports {zn, zp}];
set_input_delay 5 -clock clk [get_ports op];
set_output_delay 5 -clock clk [get_ports {zn, zp}];