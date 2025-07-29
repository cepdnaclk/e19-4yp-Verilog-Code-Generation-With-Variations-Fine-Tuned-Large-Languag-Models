module mux41b (
    input wire [3:0] c,
    input wire [1:0] s,
    output wire z
);
    always @(*)
        case (s)
            2'b00: z = c[0];
            2'b01: z = c[1];
            2'b10: z = c[2];
            2'b11: z = c[3];
        endcase
endmodule
###