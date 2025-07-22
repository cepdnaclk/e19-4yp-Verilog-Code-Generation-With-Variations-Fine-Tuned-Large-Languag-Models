module XOR_Gate(input logic [1:0] A[0:3][0:3][0:3][0:3], B[0:3][0:3][0:3][0:3], output logic [1:0] Y[0:3][0:3][0:3][0:3]);
    assign Y[0:3][0:3][0:3][0:3] = A[0:3][0:3][0:3][0:3] ^ B[0:3][0:3][0:3][0:3];
endmodule

### Verilog Model:
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char *name;
    int value;
} signal;

int main() {
    signal A[4] = {{"A[0]", 0}, {"A[1]", 0}, {"A[2]", 0}, {"A[3]", 0}};
    signal B[4] = {{"B[0]", 0}, {"B[1]", 0}, {"B[2]", 0}, {"B[3]", 0}};
    signal Y[4] = {{"Y[0]", 0}, {"Y[1]", 0}, {"Y[2]", 0}, {"Y[3]", 0}};

    while (1) {
        int i;
        printf("Enter input values for A and B\n");
        for (i = 0; i < 4; i++) {
            printf("%s: ", A[i].name);
            scanf("%d", &A[i].value);
            printf("%s: ", B[i].name);
            scanf("%d", &B[i].value);
        }

        for (i = 0; i < 4; i++) {
            Y[i].value = A[i].value ^ B[i].value;
            printf("%s: %d\n", Y[i].name, Y[i].value);
        }
    }

    return 0;
}