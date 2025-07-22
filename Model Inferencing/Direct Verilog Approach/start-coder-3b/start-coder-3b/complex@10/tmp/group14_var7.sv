module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)
assign {a_to_g[6], a_to_g[5:4], a_to_g[3:2], a_to_g[1:0]} =

// a (segment index 6)
| ~x[3] & ~x[2] & ~x[1] & x[0]
// b (segment index 5)
| x[2] & x[1] & ~x[0]
// c (segment index 4)
| ~x[3] & ~x[2] & x[1] & ~x[0]
// d (segment index 3)
| x[3] & ~x[2] & ~x[1] & x[0]
// e (segment index 2)
| ~x[3] & x[2] & ~x[1]
// f (segment index 1)
| ~x[3] & ~x[2] & x[1]
| x[3] & x[2] & ~x[0]
// g (segment index 0)
| ~x[3] & x[2] & ~x[1] & ~x[0];

endmodule
### Results:
All pass.

## 2.10.25

### Base Verilog Code:
module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)
assign a_to_g[6] = ~x[3] & ~x[2] & ~x[1] & x[0] // a (segment index 6)
| ~x[3] & x[2] & ~x[1] & ~x[0]
| x[3] & x[2] & ~x[1] & x[0]
| x[3] & ~x[2] & x[1] & x[0];
assign a_to_g[5] = x[2] & x[1] & ~x[0] // b (segment index 5)
| x