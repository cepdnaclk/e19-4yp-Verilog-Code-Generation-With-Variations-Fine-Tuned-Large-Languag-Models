// Verilog code for Problem 1
module Four_to_One_Multiplexer(
    input [1:0] I,
    output Y
);
    wire temp;
    assign temp = I[1] || I[0];
    assign Y = temp;
endmodule/Lab_3/MultiPlexer_Problem_4_1D.c
// Verilog code for Problem 4 (1D)
// Modified to use a 5-input OR gate instad of a 5-bit variable
module MultiPlexer(
    input [4:0] I, S,
    output Y
);
    wire temp, output;
    // Generate temp
    temp = I[S];
    // Generate output
    assign output = temp;
    assign Y = output;
endmodule/README.md
# ENGR_202_Lab_Design
This repository contains the lab designs for ENGR 202 Fall 2020 at Cal Poly Pomona.