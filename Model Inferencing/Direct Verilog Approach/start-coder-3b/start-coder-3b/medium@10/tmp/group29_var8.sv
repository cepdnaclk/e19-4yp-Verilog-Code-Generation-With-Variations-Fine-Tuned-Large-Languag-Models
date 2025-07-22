module regtobin(Clock, Q, data);
input Clock;
input [7:0] Q;
output [7:0] data;
reg [7:0] data;
always @(posedge Clock)
    for (int i = 0; i < 9; i++) {
        data[i] <= 0;
    }
    data[4] <= Q[7];
    data[8] <= Q[7];
    data[0] <= 0;
    data[1:2] <= Q[4:3];
    data[3] <= Q[3];
    data[5:6] <= Q[0:1];
    data[7:8] <= Q[0:0];
endmodule


```
#include <stdio.h>
#include <math.h>
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>

#define true 1
#define false 0

int main(int argc, char *argv[]) {
  int n = 6;
  int num;
  int p, q, r;

  srand((unsigned) time(NULL));

  num = (rand() % 2 + 1);
  bool isPrime = true;
  int counter = 1;
  while (isPrime) {
    isPrime = true;
    p = (rand() % n + 1);
    q = (rand() % n + 1);
    r = (rand() % n + 1);
    if (p == 1 || q == 1 || r == 1 || p == 0 || q == 0 || r == 0) {
      counter = 1;
      isPrime == false;
    }
    else {
      if (r >= p-1 && r <= q-1) {
        counter = 2;
        isPrime = false;
      }
      else if (p >= r-1 && p <= q-1) {
        counter = 3;
        isPrime = false;
      }
      else if (q >= r-1 && q <= p-1) {
        counter = 4;
        isPrime = false;
      }
    }
    if (isPrime || counter == 4) {
      if (rand() % 2) {
        printf("%d x %d x %d = %d", p, q, r, (p*q*r));
      }
      else {
        printf("%d x %d x %d = %d", p, r, q, (p*r*q));
      }
      isPrime = false;
    }
  }
  return 0;
}
#include <stdio.h>
#include <stdlib.h>

struct node {
  int data;
  struct node* next;
};

// Function to create a new node
struct node* newNode(int data) {
  struct node* new = (struct node*) malloc(sizeof(struct node));
  new->data = data;
  new->next = NULL;
  return new;
}

// Function to add a node at the end of the linked list
void addToTail(struct node* cur, int data) {
  struct node* new_node = newNode(data);
  while (cur->next!= NULL) {
    cur = cur->next;
  }
  cur->next = new_node;
}

// Function to insert a node after a given node
void insertAfter(struct node* prev_node, int data) {
  if (prev_node == NULL) {
    printf("Prev_node cannot be NULL");
    return;
  }

  struct node* new_node = newNode(data);
  new_node->next = prev_node->next;
  prev_node->next = new_node;
}

int main() {
  // Create a linked list
  struct node* head = newNode(5);
  addToTail(head, 10);
  insertAfter(head->next, 15);

  return 0;
}
#include <stdio.h>
#include <stdlib.h>

// Function to create a new node
struct node* newNode(int data) {
  struct node* new = (struct node*) malloc(sizeof(struct node));
  new->data = data;
  new->next = NULL;
  return new;
}

// Function to add a node at the end of the linked list
void addToTail(struct node* cur, int data) {
  struct node* new_node = newNode(data);
  while (cur->next!= NULL) {
    cur = cur->next;
  }
  cur->next = new_node;
}

void printList(struct node* cur) {
  while (cur!= NULL) {
    printf("%d ", cur->data);
    cur = cur->next;
  }
}

int main() {
  // Create a linked list
  struct node* head = newNode(1);
  addToTail(head, 2);
  addToTail(head, 3);
  addToTail(head, 4);

  printList(head);

  return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>


#define MAX_SIZE 21

int hash(char* key) {
  if (key >= "a" && key <= "z") {
    return key - 'a' + 1;
  }
  else if (key >= "A" && key <= "Z") {
    return key - 'A' + 1;
  }
  else if (key == " ") {
    return 0;
  }
  return -1;
}

typedef struct node {
  char data[MAX_SIZE];
  struct node* next;
} node;

bool search(node* hash_table[MAX_SIZE], char* key) {
  int hash_val = hash(key);
  node* ptr = hash_table[hash_val];
  while (ptr!= NULL) {
    if (strcmp(ptr->data, key) == 0) {
      return true;
    }
    ptr = ptr->next;
  }
  return false;
}

void insert(node* hash_table[MAX_SIZE], char* key) {
  int hash_val = hash(key);
  node* new_node = (node*) malloc(sizeof(node));
  strcpy(new_node->data, key);
  node* ptr = hash_table[hash_val];
  new_node->next = ptr->next;
  ptr->next = new_node;
  hash_table[hash_val] = ptr;
}

int main() {
  node* hash_table[MAX_SIZE];
  for (int i = 0; i < 21; i++) {
    hash_table[i] = (node*) malloc(sizeof(node));
    hash_table[i]->next = NULL;
  }
  insert(hash_table, "test");
  insert(hash_table, "Test");
  insert(hash_table, "TesT");
  printf("%d\n", search(hash_table, "test"));
  printf("%d\n", search(hash_table, "Test"));
  printf("%d\n", search(hash_table, "TesT"));
  return 0;
}
#include <stdio.h>
#include <stdlib.h>

struct node {
  int data;
  struct node* next;
};

// Function to insert a node at the beginning of the linked list
void insertAtHead(struct node** head, int data) {
  struct node* new_node = (struct node*) malloc(sizeof(struct node));
  new_node->data = data;
  new_node->next = *head;
  *head = new_node;
}

// Function to insert a node at the end of the linked list
void addToTail(struct node* cur, int data) {
  struct node* new_node = (struct node*) malloc(sizeof(struct node));
  new_node->data = data;
  new_node->next = NULL;
  while (cur->next!= NULL) {
    cur = cur->next;
  }
  cur->next = new