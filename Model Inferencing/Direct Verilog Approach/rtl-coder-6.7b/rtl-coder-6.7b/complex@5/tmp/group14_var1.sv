module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
generate
for (genvar i = 0; i < 4; i++) begin
    always @(x[i])
    begin
        if (x[i]== 1)
        a_to_g[i] = 1000111; //a
        else if (i == 1)
        a_to_g[i] = 1100011; //b
        else if (i == 2)
        a_to_g[i] = 1010000; //c
        else if (i == 3)
        a_to_g[i] = 1000000; //d
        else if (i == 4)
        a_to_g[i] = 0011010; //e
        else if (i == 5)
        a_to_g[i] = 0010000; //f
        else if (i == 6)
        a_to_g[i] = 1111001; //g
        else if (i == 7)
        a_to_g[i] = 0110000; //h
        else if (i == 8)
        a_to_g[i] = 0000000; //i
        else if (i == 9)
        a_to_g[i] = 0010001; //j
        else if (i == 10)
        a_to_g[i] = 0100000; //k
        else if (i == 11)
        a_to_g[i] = 1000110; //l
        else if (i == 12)
        a_to_g[i] = 1000010; //m
        else if (i == 13)
        a_to_g[i] = 0100001; //n
        else if (i == 14)
        a_to_g[i] = 0110001; //o
        else if (i == 15)
        a_to_g[i] = 0001010; //p
        else if (i == 16)
        a_to_g[i] = 0001010; //q
        else if (i == 17)
        a_to_g[i] = 0100100; //r
        else if (i == 18)
        a_to_g[i] = 1011000; //s
        else if (i == 19)
        a_to_g[i] = 0110010; //t
        else if (i == 20)
        a_to_g[i] = 1100001; //u
        else if (i == 21)
        a_to_g[i] = 1110001; //v
        else if (i == 22)
        a_to_g[i] = 1100010; //w
        else if (i == 23)
        a_to_g[i] = 1000101; //x
        else if (i == 24)
        a_to_g[i] = 1000001; //y
        else if (i == 25)
        a_to_g[i] = 1110100; //z
    end
end
endgenerate
endmodule