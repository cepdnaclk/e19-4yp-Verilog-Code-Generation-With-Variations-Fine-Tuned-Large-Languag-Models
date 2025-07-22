module AndOr (output X, Y, input A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule

/Project4/part2/part2.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

#define MAX_LINE_SIZE 200

extern int errno;

typedef struct {
	int value;
	int threadId;
} buffer_element;

void *func(void *arg);
buffer_element *buffer;
pthread_mutex_t myLock;
int num_of_elements;
int num_of_threads;
int num_of_iterations;
int num_of_writes;

void buffer_init() {
	errno = 0;
	buffer = malloc(num_of_elements * sizeof(buffer_element));

	for (int i = 0; i < num_of_elements; i++) {
		buffer[i].value = 0;
		buffer[i].threadId = 0;
	}

	printf("buffer initialized\n");
}

void buffer_free() {
	free(buffer);
}

void swap(buffer_element *a, buffer_element *b) {
	buffer_element temp = *a;
	*a = *b;
	*b = temp;
}

void bubble_sort(buffer_element *array, int num_of_elements) {
	for (int i = 0; i < num_of_elements; i++) {
		for (int j = 0; j < num_of_elements - 1; j++) {
			if (array[j].value > array[j + 1].value) {
				swap(&array[j], &array[j + 1]);
			}
		}
	}
}

void write_value(int pos) {
	int rand_value = rand() % 100;
	pthread_mutex_lock(&myLock);
	buffer[pos].threadId = pthread_self();
	buffer[pos].value = rand_value;
	printf("thread %lu wrote %d\n", pthread_self(), rand_value);
	pthread_mutex_unlock(&myLock);
}

void print_buffer() {
	pthread_mutex_lock(&myLock);
	printf("buffer: <");
	for (int i = 0; i < num_of_elements; i++) {
		if (buffer[i].value == 0) {
			printf("__,");
		} else {
			printf("%d,", buffer[i].value);
		}
	}
	printf(">\n");
	pthread_mutex_unlock(&myLock);
}

void *func(void *arg) {
	buffer_element *array = (buffer_element *) arg;
	for (int i = 0; i < num_of_iterations; i++) {
		for (int j = 0; j < num_of_writes; j++) {
			write_value(rand() % num_of_elements);
		}
	}
	pthread_exit(NULL);
}

int main(int argc, char **argv) {
	int num_of_threads = atoi(argv[1]);
	int num_of_elements = atoi(argv[2]);
	int num_of_iterations = atoi(argv[3]);
	int num_of_writes = atoi(argv[4]);

	srand(time(NULL));

	pthread_t *threads;
	threads = malloc(num_of_threads * sizeof(pthread_t));

	printf("num_of_threads: %d\n", num_of_threads);
	printf("num_of_elements: %d\n", num_of_elements);
	printf("num_of_iterations: %d\n", num_of_iterations);
	printf("num_of_writes: %d\n", num_of_writes);

	buffer_init();
	pthread_mutex_init(&myLock, NULL);

	for (int i = 0; i < num_of_threads; i++) {
		pthread_create(&(threads[i]), NULL, &func, buffer);
	}

	for (int i = 0; i < num_of_threads; i++) {
		pthread_join(threads[i], NULL);
	}

	buffer_free();

	return 0;
}
/Project3/part2/Makefile
all:
	iverilog -o part2 part2.v
	vvp part2
clean:
	rm -f part2
/Project2/Makefile
all:
	iverilog -o project2 project2.v
	vvp project2
clean:
	rm -f project2