module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
genvar i;
generate
for (i=0;i<4;i++) begin : inside
    assign a_to_g[6-i] = ~x[3-i] & ~x[2-i] & ~x[1-i] & x[0-i] // a (segment index 6)
    | ~x[3-i] & x[2-i] & ~x[1-i] & ~x[0-i]
    | x[3-i] & x[2-i] & ~x[1-i] & x[0-i];
end
endgenerate
endmodule

### Generated Code:
module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
genvar i;
generate
for (i=0;i<4;i++) begin : inside
    assign a_to_g[6-i] = ~x[3-i] & ~x[2-i] & ~x[1-i] & x[0-i] // a (segment index 6)
    | ~x[3-i] & x[2-i] & ~x[1-i] & ~x[0-i]
    | x[3-i] & x[2-i] & ~x[1-i] & x[0-i];
end
endgenerate
endmodule