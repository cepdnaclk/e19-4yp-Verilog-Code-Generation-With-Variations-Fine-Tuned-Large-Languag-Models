module counter3NMOS(in1,in2,in3,out1,out2);
  output out1,out2;
  input in1,in2,in3;
  wire clk,rst;
  pullup clk,rst; // Pullup the clock and reset to 1
  pulldown (rst); // Pulldown reset to 0
  assign rst = in1;
  assign clk = in2;
  // Instantiate 3-input NMOS NOR
  nor3NMOS(out1,out2,clk,rst);
endmodule
### Testbench Code:
// 3-input NMOS NOR Testbench
module counter3NMOS_tb;
  input in1,in2,in3,en1;
  output out1,out2;
  wire clk,rst;
  counter3NMOS i(in1,in2,in3,out1,out2);
  jk_counter jk(clk,rst);
  // Instantiate pullup and pulldown
  pullup clk,rst;
  pulldown (rst);
  reg [1:0] counter; // Keep track of the current state
  initial begin
    clk = 0;
    rst = 0;
    in1 = 0;
    in2 = 0;
    in3 = 0;
  end
  always @(posedge clk) begin
    case (counter)
      0: begin
        in1 = 1;
        in2 = 0;
        in3 = 0;
        in1 = 0;
        in2 = 0;
        in3 = 0;
      end
      1: begin
        if (en1)
          in1 = 1;
          in2 = 1;
          in3 = 0; // Reset the counter
          in1 = 0;
          in2 = 0;
          in3 = 0;
        else
          in1 = 0;
          in2 = 0;
          in3 = 0;
        end
      end
      2: begin
        in1 = 1;
        in2 = 1;
        in3 = 1; // Increment the C-in
      end
      default : begin
        in1 = 0;
        in2 = 0;
        in3 = 0;
      end
    endcase
  end
endmodule
### VHDL Code:
-- 3-input NMOS NOR
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity nor3NMOS is
port (in1,in2,in3,b : in std_logic);
end nor3NMOS;
architecture rtl of nor3NMOS is
begin
process(in1,in2,in3)
begin
if in2 = '1' and in3 = '1' then
b <= '1';
elsif in2 = '0' and in3 = '0' then
b <= '0';
else
b <= '0';
end if;
end process;
end rtl;
### VHDL Testbench:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity nor3NMOS_tb is
port(in1, in2, in3 : in std_logic;
en1 : in std_logic);
end nor3NMOS_tb;
 architecture rtl of nor3NMOS_tb is
signal clk, rst : std_logic;
component counter3NMOS is
port (in1, in2, in3 : in std_logic;
out1, out2 : out std_logic);
end component;
signal b1, b2 : std_logic;
begin
-- Instantiate a 3-input NMOS NOR
c : counter3NMOS port map(in1, in2, in3, b1, b2);
process
begin
clk <= '0';
rst <= '0';
in1 <= '0';
in2 <= '0';
in3 <= '0';
end process;
end rtl;
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

typedef struct node{
    int data;
    struct node* next;
} node;

node* newNode(int);
void printList(node*);
void swap(node**, node**, int, int);
void sortList(node*);
void reverse(node*);

int main(){
    node* head = newNode(3);
    head->next = newNode(5);
    head->next->next = newNode(8);
    head->next->next->next = newNode(1);
    head->next->next->next->next = newNode(2);
    printf("Original linked list: ");
    printList(head);
    sortList(head);
    printf("Sorted linked list: ");
    printList(head);
    reverse(head);
    printf("\nReversed Linked list: ");
    printList(head);
    return 0;
}

node* newNode(int value){
    node* temp = (node*)malloc(sizeof(node));
    temp->data = value;
    temp->next = NULL;
    return temp;
}

void printList(node* head){
    node* temp = head;
    while(temp!=NULL){
        printf("%d ", temp->data);
        temp = temp->next;
    }
    printf("\n");
}

// Sort a linked list using bubble sort
void sortList(node* head){
    int swapped, i;
    node* curr = head;
    node* last = NULL;
    // Keeps track of the last swapped node
    // last = NULL indicates that list is not swapped yet
    do{
        swapped = 0;
        curr = head;
        while(curr->next!= last){
            if(curr->data > curr->next->data){
                swap(&curr, &curr->next, curr->data, curr->next->data);
                swapped = 1;
            }
            curr = curr->next;
        }
        last = curr;
    } while(swapped);
}

void swap(node** a, node** b, int x, int y){
    *a = y;
    *b = x;
}

// Reverses a linked list
void reverse(node* head){
    node* temp;
    node* curr = head;
    node* prev = NULL;
    node* next;
    if(head == NULL)
        return;
    while(curr!= NULL){
        next = curr->next; // Stores the next node
        curr->next = prev; // The next node should point to previous
        prev = curr; // Updates the previous node to the current node
        curr = next; // Updates the current node to the next node
    }
    head = prev;
}



/*
Time complexity: O(n^2)
Space complexity: O(1)
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#define MAX 1000

int main(){
    char* str = "geeks";
    char* pat = "eks";
    int n = strlen(str);
    int m = strlen(pat);
    int lps[m];
    int j = 0;
    int i = 1;
    lps[0] = 0;
    while(i < m){
        if(pat[i] == pat[j]){
            j++;
            lps[i] = j;
            i++;
        }
        else{
            if(j!= 0)
                j = lps[j-1];
            else{
                lps[i] = 0;
                i++;
            }
        }
    }

    j = 0;
    i = 0;
    while(i < n){
        if(str[i] == pat[j]){
            i++;
            j++;
        }
        if(j == m){
            printf("Found pattern at index %d", i-j);
            j = lps[j-1];
        }
        else if(i < n && str[i]!= pat[j]){
            if(j!= 0)
                j = lps[j-1];
            else
                i = i + 1;
        }
    }
    return 0;
}
// Function to print matrix in zig zag pattern
void zigzag(int arr[4][4]){
    int i, j;
    // Counting the number of rows in the array
    int rows = 4;
    // Counting the number of columns in the array
    int cols = 4;
    for(i = 0; i < rows; i++){
        if(i % 2 == 0){
            for(j = 0; j < cols; j++){
                printf("%d ", arr[i][j]);
            }
        }else{
            for(j = rows-1; j >= 0; j--){
                printf("%d ", arr[i][j]);
            }
        }
    }
}
#include <iostream>
using namespace std;

class Node{
    public:
        int data;
        Node* right;
        Node* left;
};

// Function to create a new node
Node* newNode(