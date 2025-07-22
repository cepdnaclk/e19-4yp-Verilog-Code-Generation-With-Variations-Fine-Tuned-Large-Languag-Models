`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= ParOut[1:0]{1{{ParOut[6:1],sl}, ParOut[7]}};
        2: ParOut <= ParOut[6:0]{1{{ParOut[7:1],sr}, ParOut[8]}};
        3: ParOut <= ParIn;
        default: ParOut <= 8'bX;
    endcase
end
endmodule
### Execution: 
![img_2.png](img_2.png)
## 43/16/2021

![image.png](image.png)
## 43/16/2021

![image.png](image.png)

#include <iostream>
#include <string>
using namespace std;
int main(){
int a = 10, b = 20;
string str = "hello";
int *p1 = &a;
cout << p1 << endl;
cout << *p1 << endl;
p1++;
cout << p1 << endl;
cout << *p1 << endl;
return 0;
}#include <iostream>
#include <string>
using namespace std;
class Student{
public:
    string name;
    bool isMale;
    int age;
    bool hasPassed;
public:
    Student(string n = "", bool m = false, int a = 0, bool p = false) : name(n), isMale(m), age(a), hasPassed(p) {}

    void showInfo(){
        cout << "Name: " << name <<endl;
        cout << "Gender: " << (isMale? "Male" : "Female") <<endl;
        cout << "Age: " << age <<endl;
        cout << "Has Passed: " << (hasPassed? "Yes" : "No") <<endl;
    }

    ~Student(){
        cout << "Bye Bye" << endl;
    }
};

int main()
{
    Student s1("", true, 20, true);
    s1.showInfo();
    Student s2("", false, 19, false);
    s2.showInfo();
    Student *ps1 = &s1;
    Student *ps2 = &s2;
    ps1->~Student();
    ps2->~Student();
    return 0;
}#include <iostream>
#include <string>
using namespace std;
int main()
{
    int a = 20, b = 25;
    float c = 2.5;
    char d = 'A';
    bool e = false;
    string f = "hello";

    cout << "a = " << a << endl;
    cout << "b = " << b << endl;
    cout << "c = " << c << endl;
    cout << "d = " << d << endl;
    cout << "e = " << e << endl;
    cout << "f = " << f << endl;

    return 0;
}#include <iostream>
#include <string>
using namespace std;
int main()
{
    int a = 10;
    a = 12.3;
    cout << a << endl;

    int *p1 = &a;

    cout << *p1 << endl;

    int *p2;

    p2 = p1;

    cout << p2 << endl;

    int *p3;
    p3 = new int;

    *p3 = 20;

    cout << *p3 << endl;

    int *p4;
    p4 = new int;

    *p4 = 30;

    cout << *p4 << endl;

    delete p4;

    p4 = new int;

    *p4 = 50;

    cout << *p4 << endl;

    delete p4;

    return 0;
}#include <iostream>
#include <string>
using namespace std;
class Student{
public:
    string name;
    bool isMale;
    int age;
    bool hasPassed;
public:
    Student(string n = "", bool m = false, int a = 0, bool p = false): name(n), isMale(m), age(a), hasPassed(p) {}

    void ShowInfo()
    {
        cout << "Name: " << name << endl;
        cout << "Gender: " << (isMale? "Male" : "Female") << endl;
        cout << "Age: " << age << endl;
        cout << "Has Passed: " << (hasPassed? "Yes" : "No") << endl;
    }

    ~Student()
    {
        cout << "Bye Bye" << endl;
    }
};

int main()
{
    Student s1("", true, 20, true);
    s1.ShowInfo();
    Student s2("", false, 19, false);
    s2.ShowInfo();
    Student *ps1 = &s1;
    Student *ps2 = &s2;
    ps1->~Student();
    ps2->~Student();
    return 0;
}#include<iostream>
using namespace std;
class A{
    private:
        int a = 10;
    public:
        A(int val){
            a = val;
        }
        void showA()
        {
            cout << a << endl;
        }
};
class B: public A{
    private:
        double b = 3.1;
    public:
        B(int val): A(val)
        {

        }
        void showB()
        {
            cout << b << endl;
        }
};
class C: public A{
    private:
        char c = 'a';
    public:
        C(int val):A(val)
        {

        }
        void showC()
        {
            cout << c << endl;
        }
};
class D: public B, public C{
    private:
        float d = 1.2;
    public:
        D(int val):A(val), B(val), C(val)
        {

        }
        void showD()
        {
            cout << d << endl;
        }
};
int main()
{
    D obj(10);
    obj.showA();
    obj.showB();
    obj.showC();
    obj.showD();
    return 0;
}#include <iostream>
#include <string>
using namespace std;
class Rectangle{
public:
    int length;
    int breadth;
    Rectangle(int l = 10, int b = 10): length(l), breadth(b) {}
    Rectangle(int b) : breadth(b)
    {
        length = b;
    }
    void ShowArea()
    {
        cout << breadth * length << endl;
    }
};

int main()
{
    Rectangle r1(20,10);
    r1.ShowArea();
    Rectangle r2(10);
    r2.ShowArea();
    return 0;
}#include <iostream>