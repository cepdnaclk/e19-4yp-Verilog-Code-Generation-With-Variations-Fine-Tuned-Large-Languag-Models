// Verilog code for Problem 6
module Adders(
    input logic [1:0] x, y,
    output logic [1:0] s, c
);
    logic [1:0] a, b, c, d;
    logic [1:0] t[2];
    logic [1:0] s1[2], s2[2];

    assign s2[0] = 0; 
    assign s2[1] = 0; 

    // Adders
    assign a = x[0];
    assign b = y[0];
    assign c = x[1];
    assign d = y[1];

    // Adder 1
    assign s1[0] = a ^ b;
    assign s1[1] = (a | b) & ~s1[0];

    // Adder 2
    assign t[0] = d;
    assign t[1] = c;
    assign t[0] = c ^ y[1];
    assign t[1] = (c & y[1]) & ~s2[0];

    // Adder 3
    assign s2[0] = t[0] ^ d ^ s2[1];
    assign s2[1] = (t[0] | d | s2[1]) & ~s2[0]; 

    // Combiner
    assign s[0] = s1[0] ^ s2[0];
    assign c[0] = (s1[0] | s2[0]) & ~s[0];
endmodule
### Sample Run:
%./run_vlog.sh Adders
%./run_vlog.sh Adders
%./run_vlog.sh Adders
%./run_vlog.sh Adders
%./run_vlog.sh Adders
%./run_vlog.sh Adders
%./run_vlog.sh Adders
%./run_vlog.sh Adders
/Vlog_HW3/vlog_homework3.c
#include <stdio.h>

int main() {
	// Problem 1:
	printf("Problem 1 Solution\n");
	int A = 22;
	printf("A = %d\n", A);

	int X = 22 << 1;
	printf("X = %d\n", X);

	int Y = 22 >> 1;
	printf("Y = %d\n", Y);

	int Z = 22 & 3;
	printf("Z = %d\n", Z);

	int W = 22 | 3;
	printf("W = %d\n", W);

	int L = 22 ^ 3;
	printf("L = %d\n\n", L);
	

	// Problem 2:
	printf("Problem 2 Solution\n");
	int i;
	unsigned int j;
	for (i = 1; i <= 20; i++) {
		if (i % 2 == 0) {
			printf("%d\n", i);
		}
	}
	printf("\n");
	for (j = 0; j <= 255; j++) {
		if (j % 5 == 0) {
			printf("%d\n", j);
		}
	}
	printf("\n");

	// Problem 3:
	printf("Problem 3 Solution\n");
	int k;
	int l = 0;
	k = 1;
	while (k <= 5) {
		l += k;
		k = k + 1;
	}
	printf("5 = %d\n", l);
	printf("10 = %d\n", l);
	printf("15 = %d\n", l);

	// Problem 4:
	printf("Problem 4 Solution\n");
	int m;
	int n = 0;
	m = 1;
	while (m <= 15) {
		n += m;
		m = m + 1;
	}
	printf("3 + 5 + 7 + 9 + 11 + 13 + 15 = %d\n", n);
	printf("10 + 12 + 14 + 16 + 18 + 20 + 22 + 24 + 26 + 28 + 30 + 32 + 34 + 36 + 38 + 40 = %d\n", n);

	// Problem 5:
	printf("Problem 5 Solution\n");
	int p;
	int q = 1;
	p = 15;
	while (q <= 50) {
		p -= q;
		q = q + 1;
	}
	printf("15 - 1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - 11 - 12 - 13 - 14 = %d\n", p);
	printf("20 - 1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - 11 - 12 - 13 - 14 = %d\n", p);

	// Problem 6:
	printf("Problem 6 Solution\n");
	int r;
	int s = 0;
	r = 1;
	while (r <= 10) {
		s += r * r;
		r = r + 1;
	}
	printf("1 * 1 + 2 * 2 + 3 * 3 + 4 * 4 + 5 * 5 + 6 * 6 + 7 * 7 + 8 * 8 + 9 * 9 + 10 * 10 = %d\n", s);
	printf("10 * 10 + 9 * 9 + 8 * 8 + 7 * 7 + 6 * 6 + 5 * 5 +