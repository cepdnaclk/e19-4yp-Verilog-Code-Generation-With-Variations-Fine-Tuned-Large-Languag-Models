module Problem1(input [3:0] a, b, output [3:0] sum);
  logic [3:0] di;
  logic clk;
  always @(posedge clk, posedge reset)
    begin
      if (reset == 1'b1)
        di = 8'b10;
      else
        di = a + b;
    end
  assign sum = di;
endmodule
#include <iostream>
using namespace std;

void print_array(int *array, int size)
{
    for (int i = 0; i < size; i++)
    {
        cout << array[i] << " ";
    }
    cout << endl;
}

void print_matrix(int **matrix, int row, int col)
{
    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < col; j++)
        {
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }
}

int main()
{
    int a[] = {1, 2, 3, 4, 5, 6};
    print_array(a, 6);

    int **m = new int *[5];
    m[0] = new int[5];
    m[1] = new int[5];
    m[2] = new int[5];
    m[3] = new int[5];
    m[4] = new int[5];

    m[0][0] = 0;
    m[0][1] = 1;
    m[0][2] = 2;
    m[0][3] = 3;
    m[0][4] = 4;
    m[1][0] = 0;
    m[1][1] = 1;
    m[1][2] = 2;
    m[1][3] = 3;
    m[1][4] = 4;
    m[2][0] = 0;
    m[2][1] = 1;
    m[2][2] = 2;
    m[2][3] = 3;
    m[2][4] = 4;
    m[3][0] = 0;
    m[3][1] = 1;
    m[3][2] = 2;
    m[3][3] = 3;
    m[3][4] = 4;
    m[4][0] = 0;
    m[4][1] = 1;
    m[4][2] = 2;
    m[4][3] = 3;
    m[4][4] = 4;

    print_matrix(m, 5, 5);

    delete[] m[0];
    delete[] m[1];
    delete[] m[2];
    delete[] m[3];
    delete[] m[4];
    delete[] m;

    return 0;
}#include <iostream>
using namespace std;

int main()
{
    int a[3][3];
    int b[3][3];

    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            cin >> a[i][j];
        }
    }

    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            cin >> b[i][j];
        }
    }

    cout << "a:" << endl;
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            cout << a[i][j] << " ";
        }
        cout << endl;
    }

    cout << "b:" << endl;
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            cout << b[i][j] << " ";
        }
        cout << endl;
    }

    int c[3][3];

    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            c[i][j] = a[i][j] * b[i][j];
        }
    }

    cout << "c:" << endl;
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            cout << c[i][j] << " ";
        }
        cout << endl;
    }
}// The following is the base file
#ifndef MAIN_
#define MAIN_

#include <iostream>
using namespace std;

void print_array(int *array, int size)
{
    for (int i = 0; i < size; i++)
    {
        cout << array[i] << " ";
    }
    cout << endl;
}

void print_matrix(int **matrix, int row, int col)
{
    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < col; j++)
        {
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }
}

// The following is the code that you will modify
void print_matrix_int(int **matrix, int row, int col)
{
    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < col; j++)
        {
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }
}

#endif#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    int n;
    cin >> n;

    int *a = new int[n];

    for (int i = 0; i < n; i++)
    {
        cin >> a[i];
    }

    int *b = new int[n];

    for (int i = 0; i < n; i++)
    {
        b[i] = a[i];
    }

    delete[] a;

    int *c = new int[n];
    int *d = new int[n];

    for (int i = 0; i < n; i++)
    {
        c[i] = b[i] + d[i];
    }

    delete[] b;
    delete[] d;

    for (int i = 0; i < n; i++)
    {
        cout << c[i] << endl;
    }
    delete[] c;

    return 0;
}#include <iostream>
#include <cmath>
using namespace std;

float f1(int n)
{
    float sum = 0.0;
    for (int i = 1; i <= n; i++)
    {
        sum += 1.0 / (float)i;
    }
    return sum;
}

float f2(int n)
{
    float sum = 0.0;
    for (int i = 1; i <= n; i++)
    {
        sum += (float)(i % 2) / (float)i;
    }
    return sum;
}

int main()
{
    int n;
    cin >> n;

    float e1, e2;
    e1 = f1(n);
    e2 = f2(n);

    cout << "e1: " << e1 << endl;
    cout << "e2: " << e2 << endl;

    return 0;
}#include <iostream>
using namespace std;

int main()
{
    int a[3][3];
    int b[3][3];

    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            cin >> a[i][j];
        }
    }

    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            cin >> b[i][j];
        }
    }

    int c[3][3];
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            c[i][j] = a[i][j] * b[i][j];
        }
    }

    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            cout << c[i][j] << " ";
        }
        cout << endl;
    }
}#include <iostream>
using namespace std;

void print_array(int *array, int size)
{
    for (int i =