module test;
wire a;
struct packed {
    reg x;
    reg y;
    reg z;
} s;
assign #25 a = 1;
always begin
    s.x = #10 a;
end
endmodule

#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "time.h"

void print_usage(char **argv) {
	printf("usage: %s 100000000\n", argv[0]);
}

int main(int argc, char **argv) {
	if(argc!= 2) {
		print_usage(argv);
		return 1;
	}

	int n = atoi(argv[1]);
	if(n <= 0) {
		print_usage(argv);
		return 1;
	}

	int sum = 0;
	int *i_arr = malloc(n * sizeof(int));
	for(int i = 0; i < n; ++i) {
		i_arr[i] = i + 1;
		__sync_fetch_and_add(&sum, i_arr[i]);
	}

	int ref_sum = 0;
	for(int i = 0; i < n; ++i) {
		ref_sum += i + 1;
	}

	if(sum!= ref_sum) {
		printf("fail: sum = %d, ref_sum = %d\n", sum, ref_sum);
		return 1;
	}

	free(i_arr);
	return 0;
}
#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "time.h"

int main(int argc, char **argv) {
	if(argc!= 3) {
		printf("usage: %s <a> <b>\n", argv[0]);
		return 1;
	}

	int a = atoi(argv[1]);
	int b = atoi(argv[2]);
	if(a < 0 || b < 0) {
		printf("invalid input\n");
		return 1;
	}

	printf("%d\n", a + b);
	return 0;
}
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "time.h"

void print_usage(char **argv) {
	printf("usage: %s 100000000\n", argv[0]);
}

int main(int argc, char **argv) {
	if(argc!= 2) {
		print_usage(argv);
		return 1;
	}

	int n = atoi(argv[1]);
	if(n <= 0) {
		print_usage(argv);
		return 1;
	}

	int sum = 0;
	int *i_arr = malloc(n * sizeof(int));
	for(int i = 0; i < n; ++i) {
		i_arr[i] = i + 1;
		int tmp = 0;
		for(int j = 0; j < i + 1; j++) {
			tmp += i_arr[j];
		}
		__sync_fetch_and_add(&sum, tmp);
	}

	int ref_sum = 0;
	for(int i = 0; i < n; ++i) {
		int tmp = 0;
		for(int j = 0; j < i + 1; j++) {
			tmp += i_arr[j];
		}
		ref_sum += tmp;
	}

	if(sum!= ref_sum) {
		printf("fail: sum = %d, ref_sum = %d\n", sum, ref_sum);
		return 1;
	}

	free(i_arr);
	return 0;
}
#include "stdio.h"
#include "string.h"

void print_usage() {
	printf("usage:./test <in1> <in2> <in3>\n");
}

int main(int argc, char **argv) {
	if(argc!= 4) {
		print_usage();
		return 1;
	}

	int a = atoi(argv[1]);
	int b = atoi(argv[2]);
	int c = atoi(argv[3]);
	printf("%d\n", a + b + c);
	return 0;
}
#!/bin/bash

gcc -Wall -o test test.c

for i in 100000000 1000000000 10000000000; do
	./test $i > ref.out
	./test_spinlock $i > my.out
	diff my.out ref.out
done
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "time.h"

#define MAX_COUNT 10000000

void print_usage(char **argv) {
	printf("usage: %s <count>\n", argv[0]);
}

int main(int argc, char **argv) {
	if(argc!= 2) {
		print_usage(argv);
		return 1;
	}

	int count = atoi(argv[1]);
	if(count <= 0 || count > MAX_COUNT) {
		print_usage(argv);
		return 1;
	}

	srand((unsigned)time(NULL));
	int sum = 0;
	for(int i = 0; i < count; ++i) {
		int s = rand();
		sum += s;
	}
	printf("%d\n", sum);
	return 0;
}
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "time.h"

void print_usage(char **argv) {
	printf("usage: %s <count>\n", argv[0]);
}

int main(int argc, char **argv) {
	if(argc!= 2) {
		print_usage(argv);
		return 1;
	}

	int count = atoi(argv[1]);
	if(count <= 0) {
		print_usage(argv);
		return 1;
	}

	int sum = 0;
	for(int i = 0; i < count; ++i) {
		sum += i + 1;
	}
	printf("%d\n", sum);
	return 0;
}
#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "time.h"

void print_usage(char **argv) {
	printf("usage: %s <a> <b>\n", argv[0]);
}

int main(int argc, char **argv) {
	if(argc!= 3) {
		print_usage(argv);
		return 1;
	}

	int a = atoi(argv[1]);
	int b = atoi(argv[2]);
	if(a < 0 || b < 0) {
		print_usage(argv);
		return 1;
	}

	printf("%d\n", a - b);
	return 0;
}
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "time.h"

void print_usage(char **argv) {
	printf("usage: %s <count>\n", argv[0]);
}

int main(int argc, char **argv) {
	if(argc!= 2) {
		print_usage(argv);
		return 1;
	}

	int count = atoi(argv[1]);
	if(count <= 0) {
		print_usage(argv);
		return 1;
	}

	srand((unsigned)time(NULL));
	int sum = 0;
	for(int i = 0; i < count; ++i) {
		int s = rand();
		sum += s;
	}
	printf("%d\n", -sum);
	return 0;
}
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "time.h"