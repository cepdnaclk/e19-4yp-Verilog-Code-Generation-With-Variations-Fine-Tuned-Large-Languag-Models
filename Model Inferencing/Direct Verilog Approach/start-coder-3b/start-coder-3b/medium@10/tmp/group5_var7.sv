### Results:

### Comments:

### Previous Tests:

### Expected Output:

### Expected Trace:

### Test Steps:

### Test Output:

/unitTests/gen_test_cases/test_2.c
#include <stdio.h>

#define M 10
#define N 2
#define P 2

int main() {
    int m, n, p;
    m = 1; n = 2; p = 3;
    int a[M][N][P], b[N][P], c[M][P];
    int i, j, k;

    for (i = 0; i < M; i++) {
        for (j = 0; j < N; j++) {
            for (k = 0; k < P; k++) {
                a[i][j][k] = (i + j + k) % 2;
                b[j][k] = (j + k + 1) % 2;
            }
        }
    }

    for (i = 0; i < M; i++) {
        for (j = 0; j < P; j++) {
            c[i][j] = 0;
            for (k = 0; k < N; k++) {
                c[i][j] += a[i][k][j] * b[k][j];
                c[i][j] = c[i][j] % 2;
            }
        }
    }

    for (i = 0; i < M; i++) {
        for (j = 0; j < P; j++) {
            printf("%d ", c[i][j]);
        }
        printf("\n");
    }
}
/unitTests/gen_test_cases/test_3.c
#include <stdio.h>

#define M 10
#define N 2
#define P 2
#define Q 3

int main() {
    int m, n, p, q;
    m = 1; n = 2; p = 3; q = 4;
    int a[M][N][P][Q], b[N][P][Q], c[M][P][Q];
    int i, j, k, l;

    for (i = 0; i < M; i++) {
        for (j = 0; j < N; j++) {
            for (k = 0; k < P; k++) {
                for (l = 0; l < Q; l++) {
                    a[i][j][k][l] = (i + j + k + l) % 2;
                    b[j][k][l] = (j + k + l + 1) % 2;
                }
            }
        }
    }

    for (i = 0; i < M; i++) {
        for (j = 0; j < P; j++) {
            for (k = 0; k < Q; k++) {
                c[i][j][k] = 0;
                for (l = 0; l < N; l++) {
                    c[i][j][k] += a[i][l][j][k] * b[l][j][k];
                    c[i][j][k] = c[i][j][k] % 2;
                }
            }
        }
    }

    for (i = 0; i < M; i++) {
        for (j = 0; j < P; j++) {
            for (k = 0; k < Q; k++) {
                printf("%d ", c[i][j][k]);
            }
            printf("\n");
        }
        printf("\n");
    }
}
/unitTests/unitTestPlan.md
## Unit Test Plan

### Test Suite 1 - 1-D Array
| Test Case | Comment | Modified Code | Base/Verilog Code |
| ---------- | ------- | ------------- | ----------------- |
| 00001 | 2-D single dimension: `int a[M][N]`  | `int b[N][M]` | `module test_array; wire q, clock; wire [7:0] i, j, k; reg k; reg [7:0] b[N][M]; initial begin reset_ff; k = 0; end m555 timer(clock); assign q = a[i][j]; endmodule` |
| 00002 | 2-D single dimension: `int a[M][N]`  | `int b[N][M]` | `module test_array; wire q, clock; wire [7:0] i, j, k; reg k; reg [7:0] b[N][M]; initial begin reset_ff; k = 0; end m555 timer(clock); assign q = a[j][i]; endmodule` |
| 00003 | 2-D single dimension: `int a[M][N]`  | `int b[N][M]` | `module test_array; wire q, clock; wire [7:0] i, j, k; reg k; reg [7:0] b[N][M]; initial begin reset_ff; k = 0; end m555 timer(clock); assign q = a[i][k+1]; endmodule` |
| 00004 | 2-D single dimension: `int a[M][N]`  | `int b[N][M]` | `module test_array; wire q, clock; wire [7:0] i, j, k; reg k; reg [7:0] b[N][M]; initial begin reset_ff; k = 0; end m555 timer(clock); assign q = a[k+1][i]; endmodule` |
| 00005 | 2-D single dimension: `int