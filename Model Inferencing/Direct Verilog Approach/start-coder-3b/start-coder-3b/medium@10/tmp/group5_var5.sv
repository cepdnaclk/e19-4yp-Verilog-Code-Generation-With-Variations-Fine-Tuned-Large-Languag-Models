logic [3:0] state;
logic [3:0] states[5];
begin
state = 0;
state = 1;
state = 2;
state = 3;
state = 4;
assign states[state] = 1;
end
### Verilog Code:
module test_mda(
input logic clock
);
logic [3:0] state;
logic [3:0] states[5];
begin
state = 0;
states[state] = 1;
state = 1;
states[state] = 1;
state = 2;
states[state] = 1;
state = 3;
states[state] = 1;
state = 4;
states[state] = 1;
end
###