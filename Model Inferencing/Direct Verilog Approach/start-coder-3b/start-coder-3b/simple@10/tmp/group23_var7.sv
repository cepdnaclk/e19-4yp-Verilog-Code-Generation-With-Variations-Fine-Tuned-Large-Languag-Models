module NibbleReg
(output[1:0] N, input[1:0] D, Clk, input[1:0] size);
wire[1:0] N_Wire;
localparam DTot = 2;
DFF DReg(.Q(N_Wire),.D(D[size+1:size]),.Clk(Clk));
assign #DTot N = N_Wire;
endmodule
### Final Result:
The testbench passes with a 0.125ns period.

#include <iostream>
#include <unordered_map>
#include <vector>

namespace
{

struct Node
{
    Node* prev, *next;
    Node(Node* p, Node* n, int v): prev(p), next(n), value(v) {}
    int value;
};

struct List
{
    List(): head(nullptr), tail(nullptr) {}
    List(std::vector<int>& nums)
    {
        head = tail = nullptr;
        for(int i = 0; i < nums.size(); i++)
        {
            if(!tail)
            {
                tail = head = new Node(nullptr, nullptr, nums[i]);
            }
            else
            {
                tail = tail->next = new Node(tail, nullptr, nums[i]);
            }
        }
    }
    void print()
    {
        Node* temp = head;
        while(temp)
        {
            std::cout << temp->value << " ";
            temp = temp->next;
        }
        std::cout << "\n";
    }
    Node* head;
    Node* tail;
};

void del(Node* d)
{
    if(d)
    {
        delete d;
    }
}

Node* merge(List* list1, List* list2)
{
    Node* a = list1->head;
    Node* b = list2->head;
    Node* ans = nullptr;
    Node* tail = nullptr;
    while(a || b)
    {
        if(a && b)
        {
            if(a->value <= b->value)
            {
                if(!ans)
                {
                    ans = tail = a;
                }
                else
                {
                    tail->next = a;
                    tail = a;
                }
                a = a->next;
            }
            else
            {
                if(!ans)
                {
                    ans = tail = b;
                }
                else
                {
                    tail->next = b;
                    tail = b;
                }
                b = b->next;
            }
        }
        else
        {
            if(a)
            {
                if(!ans)
                {
                    ans = tail = a;
                }
                else
                {
                    tail->next = a;
                    tail = a;
                }
            }
            else
            {
                if(!ans)
                {
                    ans = tail = b;
                }
                else
                {
                    tail->next = b;
                    tail = b;
                }
            }
        }
    }
    return ans;
}

}

int main(int argc, char* argv[])
{
    List list1(std::vector<int>{1, 4, 7});
    List list2(std::vector<int>{2, 5, 8});
    std::cout << "Before merge:\n";
    list1.print();
    list2.print();
    Node* merged = merge(&list1, &list2);
    List list3(std::vector<int>{1, 2, 4, 5, 7, 8});
    std::cout << "After merge:\n";
    list3.print();
    std::cout << "Checking for validity:\n";
    while(merged)
    {