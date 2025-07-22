use vcs_sopc.cpp
module XOR_Gate(
    input logic [1:0] A [0:3], B,
    output logic Y
);
    assign Y = A ^ B;
endmodule
### Simulation Results:
![image](https://user-images.githubusercontent.com/75221133/129497250-c2e40e8c-c63c-4323-8127-7c6762e0c181.png)
### Verilog Code:
// Verilog code for Problem 4
module XOR_Gate(
    input A, B,
    output Y
);
    assign Y = A ^ B;
endmodule
### Variation Instruction