```
module Problem12(input [3:0] a, b, output [3:0] c);
  reg [3:0] temp;
  pack xy {
    reg [3:0] x;
    reg [3:0] y;
    reg [0:0] z;
  }
  assign temp = c;
  pack xy {
    xy.x = a;
    xy.y = b;
  }
  pack xy {
    c = xy.x + xy.y;
  }
endmodule
```
#ifndef __P_H_
#define __P_H_

#define true 1
#define false 0

#define AND(a, b) ((a) && (b))
#define NAND(a, b) (!((a) && (b)))
#define OR(a, b) ((a) || (b))
#define NOR(a, b) (!((a) || (b)))
#define XOR(a, b) ((a) ^ (b))
#define NXOR(a, b) (!(a ^ b))

#define NOT(a) (!a)

#define NOP() asm volatile("nop")

#define BIT(bit) (1 << (bit))

int bin_to_dec(int a);
int not_a(int a);
int not_b(int b, int a);
int and_a_b(int a, int b);
int or_a_b(int a, int b);
int not_a_and_b_or_c(int a, int b, int c);
int nor_a_b_and_c(int a, int b, int c);
int a_eq_b_or_neq_c_and_a_eq_b(int a, int b, int c);

#endif
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "p.h"

int bin_to_dec(uint8_t bin)
{
  int result = 0;
  int i;

  for (i = 0; i < 8; i++) {
    int bit = (bin >> i) & 1;
    result += bit * BIT(7 - i);
  }

  return result;
}

int not_a(int a)
{
  return ~a;
}

int not_b(int b, int a)
{
  return ~b & a;
}

int and_a_b(int a, int b)
{
  return a & b;
}

int or_a_b(int a, int b)
{
  return a | b;
}

int not_a_and_b_or_c(int a, int b, int c)
{
  return not_a(a) & b & c;
}

int nor_a_b_and_c(int a, int b, int c)
{
  return not_a(a) | b | c;
}

int a_eq_b_or_neq_c_and_a_eq_b(int a, int b, int c)
{
  return a!= c & a == b | a == b;
}

int main(int argc, char *argv[])
{
  int a = bin_to_dec(argv[1][0]);
  int b = bin_to_dec(argv[2][0]);
  int c = bin_to_dec(argv[3][0]);

  printf("a = %d, b = %d, c = %d\n", a, b, c);

  printf("NOT(a) = %d\n", not_a(a));
  printf("NOT(b) = %d\n", not_a(b));
  printf("NOT(a) & b = %d\n", not_a(a) & b);
  printf("NOT(b) & a = %d\n", not_b(b, a));
  printf("a & b = %d\n", and_a_b(a, b));
  printf("b & a = %d\n", and_a_b(b, a));
  printf("a | b = %d\n", or_a_b(a, b));
  printf("b | a = %d\n", or_a_b(b, a));
  printf("NOT(a) & b | c = %d\n", not_a(a) & b | c);
  printf("NOT(a) | b & c = %d\n", not_a(a) | b & c);
  printf("a!= c & a == b | a == b = %d\n", a_eq_b_or_neq_c_and_a_eq_b(a, b, c));
  printf("NOT(a) | NOT(b) & NOT(c) = %d\n", not_a(a) | not_b(b, a) & not_b(c, b));
  printf("NOT(NOT(a)) & NOT(NOT(b)) & NOT(NOT(c)) = %d\n", not_a(a) & not_b(b, a) & not_b(c, b));

  return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <stdint