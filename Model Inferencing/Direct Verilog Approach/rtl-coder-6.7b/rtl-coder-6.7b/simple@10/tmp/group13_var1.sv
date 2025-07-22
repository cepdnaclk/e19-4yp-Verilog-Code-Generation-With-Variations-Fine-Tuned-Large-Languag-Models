// Verilog code for Problem 7
module Multiplexer(
    input logic A, B, C, D,
    input logic Sel0, Sel1,
    output logic [7:0] Z
);
    assign Z = Sel0? (Sel1? A : B) : (Sel1? C : D);
endmodule

// Verilog code for Problem 8
module Comparator(
    input A, B, C,
    output logic [7:0] Z
);
    assign Z = (A ^ B & C) | ~(A & B) & ~C;