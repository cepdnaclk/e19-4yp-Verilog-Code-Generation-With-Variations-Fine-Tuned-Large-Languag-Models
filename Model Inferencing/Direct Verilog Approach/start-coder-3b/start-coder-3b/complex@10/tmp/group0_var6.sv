```
/*
 * Module Name: Testbench for Testing a Verilog Module
 * Author: 
 */

module tst_or_gate();

reg[3:0]a;
reg[3:0]b;
reg en;
reg[3:0]c;
wire b;
or_gate or_gate_module(b,a,en);

initial begin
 a=4'h0; // Initialize input
 en=1'b0; // Initialize enable
end

always begin
#5 $monitor("t=%0d, a = %b, en = %b, b = %b", $time,a,en,b); // Use %h for hex 'a'
end

initial $monitor("Input a is : %h\n", a); // Display values in base 10

initial $monitor("Input en is : %b\n", en); // Display values in base 10

initial $monitor("Input b is : %b\n", b); // Display values in base 10

initial begin // Stimulus generation
a=4'h0;
en=1'b0;
end

initial begin // Stimulus generation
a=4'h2;
en=1'b1;
end

initial begin // Stimulus generation
a=4'h4;
en=1'b1;
end

initial begin // Stimulus generation
a=4'h8;
en=1'b1;
end

initial begin // Stimulus generation
a=4'h10;
en=1'b1;
end

initial $monitor("Output c is : %h\n", c); // Display values in base 10

initial $monitor("t=%0d, c = %b", $time,c); // Use %h for hex 'a'

initial $stop; // Stop simulation

endmodule
```
### Simulation Output:
```
Input a is : 0
Input en is : 0
Input b is : 0
Output c is : 0
t=0, c = 0
Input a is : 0
Input en is : 1
Input b is : 0
Output c is : 0
t=5, c = 0
Input a is : 0
Input en is : 1
Input b is : 2
Output c is : 2
t=10, c = 2
Input a is : 0
Input en is : 1
Input b is : 4
Output c is : 4
t=15, c = 4
Input a is : 0
Input en is : 1
Input b is : 8
Output c is : 8
t=20, c = 8
Input a is : 0
Input en is : 1
Input b is : 10
Output c is : 10
t=25, c = 10
Output c is : 10
t=30, c = 10
```
### Testbench Output:
```
Input a is : 0
Input en is : 0
Input b is : 0
Output c is : 0
t=0, c = 0
Input a is : 0
Input en is : 1
Input b is : 0
Output c is : 0
t=5, c = 0
Input a is : 0
Input en is : 1
Input b is : 2
Output c is : 2
t=10, c = 2
Input a is : 0
Input en is : 1
Input b is : 4
Output c is : 4
t=15, c = 4
Input a is : 0
Input en is : 1
Input b is : 8
Output c is : 8
t=20, c = 8
Input a is : 0
Input en is : 1
Input b is : 10
Output c is : 10
t=25, c = 10
Output c is : 10
t=30, c = 10
```#include<stdio.h>
#include<stdlib.h>

//typedef struct node
//{
//            struct node* next;
//	        int value;
//}Node;

int main()
{
    typedef struct node
    {
            struct node* next;
	        int value;
    }Node;

    Node* a = (Node*)malloc(sizeof(Node));
    Node* b = (Node*)malloc(sizeof(Node));
    Node* c = (Node*)malloc(sizeof(Node));
    Node* d = (Node*)malloc(sizeof(Node));
    Node* e = (Node*)malloc(sizeof(Node));
    Node* f = (Node*)malloc(sizeof(Node));

    a->next = b;
    b->next = c;
    c->next = d;
    d->next = e;
    e->next = f;
    f->next = a;

    Node* head = a;

    a->value = 1;
    b->value = 2;
    c->value = 3;
    d->value = 4;
    e->value = 5;
    f->value = 6;

    printf("Node a value : %d\n",a->value);
    printf("Node b value : %d\n",b->value);
    printf("Node c value : %d\n",c->value);
    printf("Node d value : %d\n",d->value);
    printf("Node e value : %d\n",e->value);
    printf("Node f value : %d\n",f->value);

    printf("Node a next : %d\n",a->next->value);
    printf("Node b next : %d\n",b->next->value);
    printf("Node c next : %d\n",c->next->value);
    printf("Node d next : %d\n",d->next->value);
    printf("Node e next : %d\n",e->next->value);
    printf("Node f next : %d\n",f->next->value);

    return 0;
}/*
 * Module Name: Testbench for Testing a Verilog Module
 * Author: 
 */

/*
 * Verilog Code:
 * module tst_or_gate();
 * 	reg[3:0]a, b;
 * 	reg en;
 * 	wire c;
 * 	or_gate or_gate_module(c,a,en);
 * initial begin
 * 	a=4'h0; // Initialize input
 * 	en=1'b0; // Initialize enable
 * end
 * always begin
 * 	$monitor("t=%0d, a = %b, en = %b, b = %b", $time,a,en,b); // Use %h for hex 'a'
 * end
 * initial $monitor("Input a is : %h\n", a); // Display values in base 10
 * initial $monitor("Input en is : %b\n", en); // Display values in base 10
 * initial $monitor("Input b is : %b\n", b); // Display values in base 10
 * initial begin // Stimulus generation
 * end
 * initial begin // Stimulus generation
 * end
 * initial begin // Stimulus generation
 * end
 * initial begin // Stimulus generation
 * end
 * initial $monitor("Output c is : %h\n", c); // Display values in base 10
 * initial $monitor("t=%0d, c = %b", $time,c); // Use %h for hex 'a'
 * initial $stop; // Stop simulation
 * endmodule
 */

/*
 * Verilog Code:
 * module tst_xor_gate();
 * 	reg[1:0]a;
 * 	reg[1:0]b;
 * 	reg en;
 * 	wire c;
 * 	xor_gate xor_gate_module(c,a,b,en);
 * initial begin
 * 	a=2'h0; // Initialize input
 * 	b=2'h0;
 * 	en=1'b0; // Initialize enable
 * end
 * always begin
 * 	#5 $monitor("t=%0d, a = %b, en = %b, b = %b", $time,a,en,b); // Use %h for hex 'a'
 * end
 * initial $monitor("Input a is : %b\n", a); // Display values in base 10
 * initial $monitor("Input en is : %b\n", en); // Display values in base 10
 * initial $monitor("Input b is : %b\n", b); // Display values in base 10
 * initial