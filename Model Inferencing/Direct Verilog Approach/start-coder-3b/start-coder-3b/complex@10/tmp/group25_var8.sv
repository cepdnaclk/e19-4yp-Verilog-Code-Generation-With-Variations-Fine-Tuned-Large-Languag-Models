module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
wire  [3:0] HiCount; HiCount = BCD_in + 3;
assign Excess_3_out = (HiCount == {4'b0000,4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111,4'b1000,4'b1001,4'b1010,4'b1011,4'b1100,4'b1101,4'b1110,4'b1111});
endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
$dumpfile("encoder.vcd");
$dumpvars(0,t_encoder);
end
initial begin //Simulation Test Pattern
for (int i=0; i < 16; i=i+1)
begin
BCD_in = 4'b0000;
#1
Excess_3_out = {4'b0000,4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111,4'b1000,4'b1001,4'b1010,4'b1011,4'b1100,4'b1101,4'b1110,4'b1111}[i];
#1

end
//end
end
endmodule


### Results and Discussion:
![Result](/img/Result.jpg)


<p>
    <span class="h5">
    <strong>
        <center>
            <i>Figure 6: Simulation Results</i>
        </center>
    </strong>
</span>
</p>

---
## Conclusion
In this report, I have implemented and simulated the encoder, decoder, and register in Verilog.
These verilog modules have all been tested in ModelSim and Xilinx ISE Design Suite.
In addition, the modules were also tested in a real embedded FPGA (Cyclone IV), as well as the test bench on the embedded system.
Based on the results in the simulation and the embedded system, I conclude that the decoder, register, and encoder modules work as expected.
However, I am interested to learn how to write the decoder modules in a more compact way.

In addition, the modules were also tested in a real embedded FPGA (Cyclone IV), as well as the test bench on the embedded system.
Based on the results in the simulation and the embedded system, I conclude that the decoder, register, and encoder modules work as expected.
However, I am interested to learn how to write the decoder modules in a more compact way.
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv)
{
	int i,j;
	int n = 10;
	int num[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	int temp;

	srand((unsigned) time(NULL));
	
	int x = rand() % n; // get a random n
	int y = rand() % n; // get another random n
	printf("The random number is %d and %d\n",x,y);
	return 0;
}
# Embedded System: Digital Design

**

---

## Introduction

This is a repository for all the projects related to the Digital Design course.

---

# Course Description:

- Introduction to Digital Design
- Basic Digital Circuit Analog and Digital Circuit
- Digital Logic
- Digital Logic Design
- Basic FPGA Design
- Basic Embedded System Design
- Digital FPGA Design
- Advanced Digital FPGA Design
- Advanced Embedded System Design
- Design Automation on Embedded System
- Embedded System System Design
- Embedded System Architecture
- Digital System Design
- Embedded System Application
#ifndef _MATRIX_H_
#define _MATRIX_H_

#define MAX_ROW 100
#define MAX_COL 100

typedef struct
{
    int row;
    int col;
    int value[MAX_ROW][MAX_COL];
} matrix;

matrix* add(matrix* A, matrix* B);

matrix* sub(matrix* A, matrix* B);

matrix* mul(matrix* A, matrix* B);

void print(matrix* M);

#endif#ifndef _LIST_H_
#define _LIST_H_

typedef struct node *node_ptr;
struct node
{
    int data;
    node_ptr next;
};

void create(node_ptr *);
void print(node_ptr);
void add_node(node_ptr, int);
void delete_node(node_ptr, int);

#endif#include <stdio.h>
#include <stdlib.h>
#include "tree.h"

int main(int argc, char **argv)
{
	int n = 10;
	int num[10] = {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};
	int temp;

	int i,j;
	int root = 5;
	int num_of_nodes = 4;
	int path[num_of_nodes] = {0, 2, 1, 3};
	int path_length = 4;

	node_ptr root_ptr = NULL;
	int *path_buffer[num_of_nodes];
	node_ptr p = NULL;
	node_ptr tree[num_of_nodes];

	create(root_ptr, num[root]);
	print(root_ptr);
	
	for (i=0; i < num_of_nodes; i++)
	{
		tree[i] = malloc(sizeof(struct node));
		tree[i]->data = num[path[i]];
		tree[i]->next = NULL;

		p = root_ptr;
		while (n--)
		{
			if (path[i] > p->data)
				p = p->right;
			else
				p = p->left;
		}

		if (path[i] > p->data)
			p->right = tree[i];
		else
			p->left = tree[i];
	}

	print(root_ptr);

	return 0;
}#ifndef _QUEUE_H_
#define _QUEUE_H_

typedef struct node *node_ptr;
struct node
{
    int data;
    node_ptr next;
};

node_ptr head;
node_ptr tail;

void create_queue();
void enqueue(int data);
int dequeue();
int is_empty();

#endif#include <stdio.h>
#include <stdlib.h>
#include "list.h"

int main(int argc, char **argv)
{
	int n = 10;
	int num[10] = {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};
	int temp;

	int i,j;
	int root = 5;
	int num_of_nodes = 4;
	int path[num_of_nodes] = {0, 2, 1, 3};
	int path_length = 4;

	node_ptr root_ptr = NULL;
	int *path_buffer[num_of_nodes];
	node_ptr p = NULL;
	node_ptr tree[num_of_nodes];

	create(root_ptr, num[root]);
	print(root_ptr);
	
	for (i=0; i < num_of_nodes; i++)
	{
		tree[i] = malloc(sizeof(struct node));
		tree[