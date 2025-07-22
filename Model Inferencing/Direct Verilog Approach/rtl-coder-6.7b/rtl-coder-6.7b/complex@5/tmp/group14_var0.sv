module hex7seg_le_var (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
wire [3:0] x_esc = `esc_name(x);
generate
if (`inside(x_esc, 2'b0000, 2'b1001)) begin: gen_segments
  always @* begin
    a_to_g[6] = ~x[3] & ~x[2] & ~x[1] & x[0] // a (segment index 6)
    | ~x[3] & x[2] & ~x[1] & ~x[0]
    | x[3] & x[2] & ~x[1] & x[0]
    | x[3] & ~x[2] & x[1] & x[0];
    a_to_g[5] = x[2] & x[1] & ~x[0] // b (segment index 5)
    | x[3] & x[1] & x[0]
    | ~x[3] & x[2] & ~x[1] & x[0]
    | x[3] & x[2] & ~x[1] & ~x[0];
    a_to_g[4] = ~x[3] & ~x[2] & x[1] & ~x[0] // c (segment index 4)
    | x[3] & x[2] & x[1]
    | x[3] & x[2] & ~x[0];
    a_to_g[3] = ~x[3] & ~x[2] & ~x[1] & x[0] // d (segment index 3)
    | ~x[3] & x[2] & ~x[1] & ~x[0]
    | x[3] & ~x[2] & x[1] & ~x[0]
    | x[2] & x[1] & x[0];
    a_to_g[2] = ~x[3] & x[0] // e (segment index 2)
    | ~x[3] & x[2] & ~x[1]
    | ~x[2] & ~x[1] & x[0];
    a_to_g[1] = ~x[3] & ~x[2] & x[0] // f (segment index 1)
    | ~x[3] & ~x[2] & x[1]
    | ~x[3] & x[1] & x[0]
    | x[3] & x[2] & ~x[1] & x[0];
    a_to_g[0] = ~x[3] & ~x[2] & ~x[1] // g (segment index 0)
    | x[3] & x[2] & ~x[1] & ~x[0]
    | ~x[3] & x[2] & x[1] & x[0];
  end
end
endgenerate
endmodule
### Variation Report:
| Variation                                | Score |
| ---------------------------------------- | ----- |
| Original                                 | 100   |
| `inside` check for `x` using an indexed part select, placed in a generate block with escaped name | -100  |