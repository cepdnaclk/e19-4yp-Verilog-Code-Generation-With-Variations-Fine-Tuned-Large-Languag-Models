module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);

case (sw)
3'bi000: ld = {and4_, or4_, xor4_}; // Apply 'and4_', 'or4_' and 'xor4_' in order
3'bi001: ld = {and4_, or4_, xor4_}; // Apply 'and4_', 'or4_' and 'xor4_' in order
// 3'bi010: ld = {and4_, or4_, xor4_}; // Apply 'and4_', 'or4_' and 'xor4_' in order
3'bi011: ld = {and4_, or4_, xor4_}; // Apply 'and4_', 'or4_' and 'xor4_' in order
// 3'bi100: ld = {and4_, or4_, xor4_}; // Apply 'and4_', 'or4_' and 'xor4_' in order
3'bi101: ld = {and4_, or4_, xor4_}; // Apply 'and4_', 'or4_' and 'xor4_' in order
// 3'bi110: ld = {and4_, or4_, xor4_}; // Apply 'and4_', 'or4_' and 'xor4_' in order
3'bi111: ld = {and4_, or4_, xor4_}; // Apply 'and4_', 'or4_' and 'xor4_' in order
default: ld = {and4_, or4_, xor4_}; // Apply 'and4_', 'or4_' and 'xor4_' in order
endcase

endmodule
### Generated Verilog Code:
module gates4_top (
input wire [3:0] sw,
output wire [2:0] md
);

// Wire declarations
wire [2:0] md;

// Module instantiations
gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(sw),
.and4_(md[2]),
.or4_(md[1]),
.xor4_(md[0])
);

endmodule

# Simulation

### Waveform

We can see that the first operand is getting applied first and the third operand gets applied when the second operand is high; the second operand is high at the start and then it gets low at 16k cycles, as the first operand is still getting applied.

If we check the output value, the first operand is getting applied first and the third operand gets applied when the second operand is high; the output gets applied when the second operand is high and then its value goes low when the third operand is low.

# Summary

This post is a follow-up to the previous post in this series. We will see in this post how to perform variable-length case using constant value index.

You may refer to this post to learn about the synthesis and implementation of variable-length case statements.