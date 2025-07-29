// Verilog code for Problem 4 with modifications
module XOR_Gate(
    input A [1:0], B [1:0],
    output Y [1:0]
);
    assign Y = A ^ B;
endmodule
### Output from Vivado C Simulation: