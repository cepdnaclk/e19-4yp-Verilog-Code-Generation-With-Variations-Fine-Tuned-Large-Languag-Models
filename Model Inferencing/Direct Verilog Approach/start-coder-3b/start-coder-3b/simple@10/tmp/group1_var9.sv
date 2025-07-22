// Verilog code for Problem 4
// module XOR_Gate_Array(
//     input A, B,
//     output Y
// );
//     logic [3]A ; // Packing 4 bits for A
//     logic [3]B ; // Packing 4 bits for B
//     logic [3]Y ; // Packing 4 bits for Y
//     assign Y = A ^ B;
// endmodule

module XOR_Gate_Array_1D(
    input [1:0]A, B,
    output Y
);
    assign Y = A ^ B;
endmodule

module XOR_Gate_Array_2D(
    input [1:0]A, [1:0]B,
    output Y
);
    assign Y = A ^ B;
endmodule

module XOR_Gate_Array_3D(
    input [1:0]A, [1:0]B, [1:0]C,
    output Y
);
    assign Y = A ^ B ^ C;
endmodule

module XOR_Gate_Array_4D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D,
    output Y
);
    assign Y = A ^ B ^ C ^ D;
endmodule

module XOR_Gate_Array_5D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E;
endmodule

module XOR_Gate_Array_6D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F;
endmodule

module XOR_Gate_Array_7D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F, [1:0]G,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F ^ G;
endmodule

module XOR_Gate_Array_8D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F, [1:0]G, [1:0]H,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F ^ G ^ H;
endmodule

module XOR_Gate_Array_9D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F, [1:0]G, [1:0]H, [1:0]I,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F ^ G ^ H ^ I;
endmodule

module XOR_Gate_Array_10D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F, [1:0]G, [1:0]H, [1:0]I, [1:0]J,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F ^ G ^ H ^ I ^ J;
endmodule

module XOR_Gate_Array_11D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F, [1:0]G, [1:0]H, [1:0]I, [1:0]J, [1:0]K,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F ^ G ^ H ^ I ^ J ^ K;
endmodule

module XOR_Gate_Array_12D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F, [1:0]G, [1:0]H, [1:0]I, [1:0]J, [1:0]K, [1:0]L,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F ^ G ^ H ^ I ^ J ^ K ^ L;
endmodule

module XOR_Gate_Array_13D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F, [1:0]G, [1:0]H, [1:0]I, [1:0]J, [1:0]K, [1:0]L, [1:0]M,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F ^ G ^ H ^ I ^ J ^ K ^ L ^ M;
endmodule

module XOR_Gate_Array_14D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F, [1:0]G, [1:0]H, [1:0]I, [1:0]J, [1:0]K, [1:0]L, [1:0]M, [1:0]N,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F ^ G ^ H ^ I ^ J ^ K ^ L ^ M ^ N;
endmodule

module XOR_Gate_Array_15D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F, [1:0]G, [1:0]H, [1:0]I, [1:0]J, [1:0]K, [1:0]L, [1:0]M, [1:0]N, [1:0]O,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F ^ G ^ H ^ I ^ J ^ K ^ L ^ M ^ N ^ O;
endmodule

module XOR_Gate_Array_16D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F, [1:0]G, [1:0]H, [1:0]I, [1:0]J, [1:0]K, [1:0]L, [1:0]M, [1:0]N, [1:0]O, [1:0]P,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F ^ G ^ H ^ I ^ J ^ K ^ L ^ M ^ N ^ O ^ P;
endmodule

module XOR_Gate_Array_17D(
    input [1:0]A, [1:0]B, [1:0]C, [1:0]D, [1:0]E, [1:0]F, [1:0]G, [1:0]H, [1:0]I, [1:0]J, [1:0]K, [1:0]L, [1:0]M, [1:0]N, [1:0]O, [1:0]P, [1:0]Q,
    output Y
);
    assign Y = A ^ B ^ C ^ D ^ E ^ F ^ G ^ H ^ I ^ J ^ K ^ L ^ M ^ N ^ O ^ P ^ Q;
endmodule

module XOR_Gate_Array_1