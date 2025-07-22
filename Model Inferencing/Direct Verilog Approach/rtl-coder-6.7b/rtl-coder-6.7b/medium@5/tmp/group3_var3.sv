#include <stdio.h>
const int N = 10;
void main()
{
    int a[10] = { 1, 0, 0, 1, 0, 0, 0, 0, 0, 0 };
    int b[10] = { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 };
    int c[10];
    for (int i = 0; i < N; i++)
        c[i] = a[i] & b[i];
    for (int i = 0; i < N; i++)