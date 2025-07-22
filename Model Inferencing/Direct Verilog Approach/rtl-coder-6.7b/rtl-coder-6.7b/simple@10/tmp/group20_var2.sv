module latch (input d, c, output reg q, q_b );
output reg [7:0] d;
output reg [7:0] c;
output reg [7:0] q;
output reg [7:0] q_b;
d = d_b;
c = c_b;
q = q_a;
q_b = q_b_a;
// Union Variation
union {
struct packed {
logic [7:0] q;
logic [7:0] q_b;
} outA;
logic [15:0] outB;
} latch_out;
initial begin
latch_out.outA.q = 1;
latch_out.outA.q_b = 3;
latch_out.outB = ~latch_out.outA.q + ~latch_out.outA.q_b;
$display ("Union: outA = %h, outB = %h", latch_out.outA, latch_out.outB);
end
endmodule