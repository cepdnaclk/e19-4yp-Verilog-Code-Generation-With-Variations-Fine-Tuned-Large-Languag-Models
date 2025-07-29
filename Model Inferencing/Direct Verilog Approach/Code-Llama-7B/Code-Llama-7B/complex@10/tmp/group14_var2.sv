module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)
generate
for(genvar i = 6; i >= 0; i--) begin: inside_loop

    always_comb begin
        if (i == 6) 
            a_to_g[i] = ~x[3] & ~x[2] & ~x[1] & x[0]; // a (segment index 6)
        else if (i == 5)
            a_to_g[i] = x[2] & x[1] & ~x[0]; // b (segment index 5)
        else if (i == 4)
            a_to_g[i] = ~x[3] & ~x[2] & x[1] & ~x[0]; // c (segment index 4)
        else if (i == 3)
            a_to_g[i] = ~x[3] & ~x[2] & ~x[1] & x[0]; // d (segment index 3)
        else if (i == 2)
            a_to_g[i] = ~x[3] & x[0]; // e (segment index 2)
        else if (i == 1)
            a_to_g[i] = ~x[3] & ~x[2] & x[0]; // f (segment index 1)
        else if (i == 0)
            a_to_g[i] = ~x[3] & ~x[2] & ~x[1]; // g (segment index 0)
        else
            a_to_g[i] = 1'b0;
    end
end
endgenerate
endmodule