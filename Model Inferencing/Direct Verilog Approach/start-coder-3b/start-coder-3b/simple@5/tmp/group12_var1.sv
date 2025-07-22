```verilog
module Problem1(input [3:0] a, b, output [3:0] sum);
  logic [3:0] sum;
  always @ (posedge clk) begin
    sum <= (a + b);
  end
endmodule
```
/Practice/2016-2017/2/2016-212.c
#include <stdio.h>

int gcd(int a, int b) {
  if (b == 0) return a;
  return gcd(b, a % b);
}

int main() {
  int a, b;
  scanf("%d", &a);
  scanf("%d", &b);
  printf("%d", gcd(a, b));
  return 0;
}

int gcd_iterative(int a, int b) {
  // Find the smaller in a and b to reduce the complexity of the loop
  int min = a;
  if (a > b) {
    min = b;
  }

  int i;
  for (i = 2; i <= min; b);
}
i++) {
    if ((a % i == 0) && (b % i == 0)) {
      return i;
    }
  }
  return 1;
}

int main_iterative() {
  int a, b;
  scanf("%d", &a);
  scanf("%d", &b);
  printf("%d", gcd_iterative(a, /Practice/2016-2017/2/2016-219.c
#include <stdio.h>

int main() {
  int a, b, c;
  scanf("%d", &a);
  
  }
  return 0;
}
scanf("%d", &b);
  scanf("%d", &c);
  if (a + b + c == 180 && a == b && b == c) {
    printf("Equilateral Triangle");
  } else if (a + b + c == 180 && a == b || a + b + c == 180 && a == c || a + b + c == 180 && b == c) {
    printf("Isosceles Triangle");
  } else {
    printf("Scalene Triangle");/Practice/2016-2017/2/2016-210.c
#include <stdio.h>

int main() {
  int a = 0;
  int b = 0;
  scanf("%d", &a);
  scanf("%d", &b);
  int sum = 0;
  int i = 0;
  for (i = 0; i <= b - a; i++) {
    sum += a + i;
  }
  printf("%d", sum);
  return 0;
}
/Practice/2016-2017/3/2016-301.c
#include <stdio.h>

int main() {
  int a, b;
  scanf("%d", &a);
  scanf("%d", &b);

  // If a is greater than b, swap values
  if (a > b) {
    int tmp = a;
    a = b;
    b = tmp;
  }

  int tmp;
  if (b % 2 == 0) {
    tmp = b;
  } else if (b % 2!= 0) {
    tmp = b - 1;
  }

  int j, k;
  int sum = 0;
  for (j = a; j <= tmp; j++) {
    if (j % 2!= 0) {
      sum += j;
    }
  }
  printf("%d", sum);
  return 0;
}

};

// Find the gcd of the numbers using a recursive helper function
int gcd(int a, int b) {
  return b? gcd(b, a % b) : a;
}

// Divide the two inputted numbers and check for the gcd of the quotient
int main(int argc, char** argv) {
  int a, b;
  if (argc == 3) {
    a = atoi(argv[1]);
    b = atoi(argv[2]);
    printf("%d", gcd(a, b));
  } else {
    printf("The input was invalid. Please try again.");
  }
}
/Practice/2016-2017/3/2016-304.c
#include <stdio.h>
#include <stdlib.h>

struct node {
  int num;
  struct node* next;/Practice/2016-2017/4/2016-414.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct node {
  int val;
  struct node* next;
};

struct list {
  struct node* head;
};

struct node* new_node(int val) {
  struct node* new;
  new = malloc(sizeof(struct node));
  new -> val = val;
  new -> next = NULL;
  return new;
}

void push(struct list* list, int val) {
  struct node* new = new_node(val);
  new -> next = list -> head;
  list -> head = new;
}

int check_palindrome(struct list* list) {
  // Declare a current, previous, and next node variable
  struct node* current = list -> head;
  struct node* prev = NULL;
  struct node* next = NULL;

  // Iterate through each node in the list and assign the previous and next nodes accordingly.
  while (current!= NULL) {
    if (current -> next == NULL) {
      next = NULL;
    } else {
      next = current -> next;
    }

    if (prev == NULL) {
      next = NULL;
    } else {
      prev -> next = next;
    }

    current -> next = prev;
    prev = current;
    current = next;
  }
  // Store the head node reference
  current = list -> head;
  // Compare the current node to the previous node to determine if the list is a palindrome
  while (current!= NULL) {
    if (current -> val!= prev -> val) {
      return 0;
    }
    prev = prev -> next;
    current = current -> next;
  }
  return 1;
}

int main() {
  struct list* list = malloc(sizeof(struct list));
  list -> head = NULL;
  char input[1024];
  fgets(input, sizeof(input), stdin);
  int i, j;
  for (i = 0; i < strlen(input); i++) {
    if (input[i]!= '\n') {
      push(list, input[i]);
    }
  }
  printf("%d", check_palindrome(list));
  return 0;
}
/Practice/2016-2017/2/2016-204.c
#include <stdio.h>

int main() {
  int a = 0;
  scanf("%d", &a);
  int i;
  for (i = 1; i <= 42; i++) {
    if (i % a == 0) {
      printf("Yes");
      return 0;
    }
  }
  printf("No");
  return 0;
}
/Practice/2016-2017/4/2016-405.c
#include <stdio.h>
#include <stdlib.h>

struct node {
  int val;
  struct node* next;
};

struct list {
  struct node* head;
};

struct node* new_node(int val) {
  struct node* new;
  new = malloc(sizeof(struct node));
  new -> val = val;
  new -> next = NULL;
  return new;
}

void push(struct list* list, int val) {
  struct node* new = new_node(
  struct node* current = list -> head;
  while (current!= NULL) {
    printf("%d ", current -> val);
    current = current -> next;
  }
  return 0;
}
val);
  new -> next = list -> head;
  list -> head = new;
}

void insert(struct list* list, int val) {
  int count = 0;
  struct node* current = list -> head;
  while (current!= NULL) {
    count++;
    current = current -> next;
  }
  // If there is only one element in the list, point the head node to the new node
  if (count == 1) {
    list -> head = new_node(val);
  } else {
    // Iterate through the list until the current node is the second to last node
    struct node* previous = list -> head;
    int i = 0;
    while (i < count - 2) {