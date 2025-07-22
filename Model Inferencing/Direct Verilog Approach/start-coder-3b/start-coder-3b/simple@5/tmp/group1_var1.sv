// Verilog code for Problem 4
module XOR_Gate(
    input logic [3:0]A,
    input logic [3:0]B,
    output logic Y
);
    assign Y = A ^ B;
endmodule
### Base Verilog Code:
// Verilog code for Problem 4
module XOR_Gate(
    input [1:0]A,
    input [1:0]B,
    output [1:0]Y
);
    assign Y = A ^ B;
endmodule/Lab-6/Problem4/problem4.py
import sys
from math import fsum
from math import sqrt

n = int(sys.argv[1])
a = float(sys.argv[2])
b = float(sys.argv[3])


def f(x):
    return (x*x*x + 4*x + 1) / (2*x + a) + 100


def f_prime(x):
    return (12*x*x + 12*x + b) / (2*x + a)

x = [b]

for i in range(n):
    x1 = x[i] - f(x[i]) / f_prime(x[i])
    x.append(x1)

print(f"Approximate value of x is {x[-1]}")

if x[-1] == b:
    print("The function is bounded")
else:
    print("The function is unbounded")


def compute_e(x):
    return fsum(1 / (i*f_prime(x[i])) for i in range(n))


print(f'The value of e is {compute_e(x)}')


def approx_e(x):
    return 1 / 2 * sqrt(2 / compute_e(x))
    # print(f"The actual value of e is {sqrt(2 / compute_e(x))}")


print(f"The approximate value of e is {approx_e(x)}")

# Equation is bounded
# Approximate value of e is 1.0001629182277057
# The actual value of e is 1.0001065465080413
/Lab-7/Lab7/Lab7_problem3.cpp
#include <iostream>
#include <fstream>
using namespace std;
int main()
{
    ofstream fout("data.txt", ofstream::out);
    fout << "This is the output of Lab 7 Problem 3" << endl;
    fout.close();
}/Lab-5/Lab5/Lab5_P4.cpp
// Verilog code for Problem 4

#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char *argv[])
{

    int a[4] = {0,1,2,3};
    int b[4] = {0,1,2,3};
    int ans = 0;

    for(int i = 0; i < 4; i++)
    {
        ans ^= a[i] ^ b[i];
    }
    cout << "ans = " << ans << endl;

    return 0;
}
/Lab-5/Lab5/Lab5_P1.cpp
// Verilog code for Problem 1

#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char *argv[])
{

    int a, b, c, d, ans;

    a = 1;
    b = 2;
    c = 3;
    d = 4;
    ans = (a && b) || (c || d);
    cout << "ans = " << ans << endl;

    return 0;
}
/Lab-8/Lab8/Lab8_P1.cpp
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main(int argc, char *argv[])
{
    string input;
    ifstream fin;
    // Open the file
    fin.open("Lab8_P1.txt", ios::in);
    if (fin.is_open())
    {
        cout << "The file was opened successfully!" << endl;
        // Read from the file
        while (fin >> input)
        {
            cout << input << endl;
            cout << "Type 'done' to stop" << endl;
            cin >> input;
            if (input == "done")
            {
                break;
            }
        }
        // Close the file
        fin.close();
        cout << "The file was closed successfully!" << endl;
    }
    else
    {
        // Could not open the file
        cout << "Error opening file" << endl;
    }
}
/Lab-5/Lab5/Lab5_P2.cpp
// Verilog code for Problem 2

#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char *argv[])
{

    int a, b, c, ans;

    a = 1;
    b = 2;
    c = 4;
    ans = (a == b && b!= c) || (c <= b);
    cout << "ans = " << ans << endl;

    return 0;
}
/Lab-7/Lab7/Lab7_problem4.cpp
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main(int argc, char *argv[])
{
    string input;
    ifstream fin;
    // Open the file
    fin.open("Lab7_problem4.txt", ios::in);
    if (fin.is_open())
    {
        cout << "The file was opened successfully!" << endl;
        // Read from the file
        while (fin >> input)
        {
            cout << input << endl;
            cout << "Type 'done' to stop" << endl;
            cin >> input;
            if (input == "done")
            {
                break;
            }
        }
        // Close the file
        fin.close();
        cout << "The file was closed successfully!" << endl;
    }
    else
    {
        // Could not open the file
        cout << "Error opening file" << endl;
    }
}/Lab-7/Lab7/Lab7_problem2.cpp
#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char *argv[])
{
    ofstream fout;
    fout.open("Lab7_problem2.txt", ofstream::app);
    if (fout.is_open())
    {
        cout << "File opened successfully" << endl;
        fout << "Hello, World!" << endl;
        fout.close();
        cout << "File closed successfully!" << endl;
    }
    else
    {
        cout << "Error opening file" << endl;
    }

}