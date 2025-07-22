// Verilog code for Problem 17
module XNOR_Gate(
    input logic [1:0] A, B,
    output logic Y
);
    assign Y = ~(A ^ B);
endmodule
###