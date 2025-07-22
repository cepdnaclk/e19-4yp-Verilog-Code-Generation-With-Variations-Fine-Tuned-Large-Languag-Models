module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
logic [7:0] in_expanded;
assign in_expanded = in << 8;
assign in_expanded = in_expanded ^ in;
assign parity = in_expanded;
assign all_ones = in_expanded & in;
endmodule
### Variation Result:
Test Report:

Test #1: FAIL
Test #2: PASS
Test #3: PASS

### Original Verilog Test Code:
module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
assign all_ones = in ^ in;
endmodule
### Base Verilog Code:
module par(