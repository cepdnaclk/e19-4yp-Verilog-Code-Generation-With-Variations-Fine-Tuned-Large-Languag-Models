```verilog
module latch (input d, c, output reg [63:0] q, q_b);

typedef union packed {
  logic [63:0] data;
  struct packed {
    logic [31:0] d31_0;
    logic [31:0] d63_32;
  } bits;
} latch_output;

latch_