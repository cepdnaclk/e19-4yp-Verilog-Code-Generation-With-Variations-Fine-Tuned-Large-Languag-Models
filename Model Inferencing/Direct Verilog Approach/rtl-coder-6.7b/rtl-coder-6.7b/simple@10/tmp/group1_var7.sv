// Verilog code for Problem 4
module XOR_Gate(
    input logic [1:0] A [0:3][0:1],
    output logic [1:0] Y [0:3][0:1]
);
    always_comb begin
        Y[0] = A[0] ^ {A[1][0], A[1][1]};
        Y[1] = A[2] ^ {A[3][0], A[3][1]};
        Y[2] = A[4] ^ {A[5][0], A[5][1]};
        Y[3] = A[6] ^ {A[7][0], A[7][1]};
    end
endmodule
### Base C Language:
// C code for Problem 4
int main(int argc, char *argv[]) {
    int A[4][2], Y[4][2];
    
    // Initialize the inputs
    A[0][0] = 1; A[0][1] = 0;
    A[1][0] = 0; A[1][1] = 1;
    A[2