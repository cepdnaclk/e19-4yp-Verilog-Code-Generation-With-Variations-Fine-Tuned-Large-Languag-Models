`timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(tplh2, tphl2) (y, im1, im2, im3);
always @(*)
    y=maj3(a,b,c);
endmodule
module maj3 (input a, b, c, output [2:0] y);
    always @(*)
        y[0]=a&b|a&c|b&c;
    always @(*)
        y[1]=a&b&c;
    always @(*)
        y[2]=a|b|c;
endmodule`
### Listing of C code with syntax highlighting:

`#include "std_types.h"


int maj3(int x, int y, int z);


int main()
{
    int a,b,c,y[3];

    do
    {
        scanf("%d %d %d", &a, &b, &c);
        y[0]=maj3(a,b,c);
        y[1]=maj3(a,c,b);
        y[2]=maj3(b,a,c);
        for (int i=0; i<3;i++)
        {
            printf("%d",y[i]);
            if (i==2)
                printf("\n");
            else
                printf(" ");
        }

    } while (1);

    return 0;
}

int maj3(int x, int y, int z)
{
    int xy,xz,yz,xy1,xz1,yz1;

    xy=x&y;
    xz=x&z;
    yz=y&z;

    xy1=~xy;
    xz1=~xz;
    yz1=~yz;

    return xy1&xz1&yz1 | xy&xz1&yz1 | xy1&xz&yz1 | xy1&xz1&yz;


}`
### Compatibility: