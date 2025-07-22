module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + {count[1]};
end
endmodule
### Simulation Results:
![](./figures/9A_2.png)
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#define MAX 10

struct edge {
    int to;
};

struct node {
    int id;
    struct edge* edges;
    struct node* next;
};

struct stack {
    struct node** arr;
    int top;
};

struct queue {
    struct node** arr;
    int front, rear;
    int size;
};

struct graph {
    int V;
    struct node** nodes;
};

struct graph* createGraph(int V) {
    struct graph* g = (struct graph*) malloc(sizeof(struct graph));
    g -> V = V;
    g -> nodes = (struct node**) malloc(V * sizeof(struct node*));
    for (int v = 0; v < V; ++v)
        g -> nodes[v] = NULL;

    return g;
}

struct node* newNode(int id) {
    struct node* n = (struct node*) malloc(sizeof(struct node));
    n -> id = id;
    n -> edges = NULL;
    n -> next = NULL;

    return n;
}

void addEdge(struct graph* g, int from, int to) {
    struct node* n = newNode(to);
    n -> next = g -> nodes[from];
    g -> nodes[from] = n;

    n = newNode(from);
    n -> next = g -> nodes[to];
    g -> nodes[to] = n;
}

// int isValidEdge(struct edge* edges, int size, int to) {
//     for (int i = 0; i < size; ++i) {
//         if (edges[i].to == to)
//             return 0;
//     }
//     return 1;
// }

void addEdges(struct graph* g, int from, int* tos, int size) {
    struct edge* edges = (struct edge*) malloc(size * sizeof(struct edge));
    for (int i = 0; i < size; ++i) {
        edges[i].to = tos[i];
    }
    struct node* n = newNode(from);
    n -> edges = edges;
    n -> next = g -> nodes[from];
    g -> nodes[from] = n;

    n = newNode(from);
    n -> edges = edges;
    n -> next = g -> nodes[to];
    g -> nodes[to] = n;
}

void printGraph(struct graph* g) {
    for (int v = 0; v < g -> V; ++v) {
        printf("%d -> ", v);
        struct node* n = g -> nodes[v];
        while (n) {
            if (n -> edges) {
                int size = n -> edges -> to + 1;
                printf("[");
                for (int i = 0; i < size; ++i) {
                    if (i!= size - 1)
                        printf("%d, ", n -> edges[i].to);
                    else
                        printf("%d] ", n -> edges[i].to);
                }
            }
            n = n -> next