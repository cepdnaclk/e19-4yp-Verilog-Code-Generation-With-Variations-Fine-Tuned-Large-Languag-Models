\# include <systemc.h\>
\# include <stdio.h\>
\# include <stdint.h\>
\# include <stdlib.h\>
\# include <xmr-array.h\>
typedef uint8\_t u8;
# define array\_size(x) (sizeof(x) / sizeof(x[0]))
typedef xmr::array\_t<u8> xmr\_array\_t;
typedef xmr::array\_iterator\_t<u8> xmr\_array\_iterator\_t;
int sc\_main(int argc, char \*argv[])
{
 sc\_signal\<bool\>\* sig\_a;
 sc\_signal\<bool\>\* sig\_b;
 sc\_signal\<bool\>\* sig\_c;
 sc\_signal\<bool\>\* sig\_y;
 sc\_signal\<bool\>\* sig\_im1;
 sc\_signal\<bool\>\* sig\_im2;
 sc\_signal\<bool\>\* sig\_im3;
 xmr\_array\_t inputs;
 xmr\_array\_t outputs;
 xmr\_array\_t im1;
 xmr\_array\_t im2;
 xmr\_array\_t im3;
 const int array\_length = 10;
 inputs.resize(array\_length);
 for (int i = 0; i < array\_length; ++i)
 {
 inputs[i] = false;
 }
 sc\_trace\_file\* tf = sc\_create\_vcd\_trace\_file("maj3");
 tf->set\_time\_unit(1, SC\_NS);
 tf->set\_time\_unit(1, SC\_PS);
 sig\_a = new sc\_signal\("a"\);
 sig\_b = new sc\_signal\("b"\);
 sig\_c = new sc\_signal\("c"\);
 sig\_y = new sc\_signal\("y"\);
 sig\_im1 = new sc\_signal\("im1"\);
 sig\_im2 = new sc\_signal\("im2"\);
 sig\_im3 = new sc\_signal\("im3"\);
 inputs[0] = true;
 inputs[1] = true;
 inputs[2] = true;
 outputs.resize(1);
 im1.resize(1);
 im2.resize(1);
 im3.resize(1);
 xmr\_array\_iterator\_t iter\_inputs(inputs);
 xmr\_array\_iterator\_t iter\_outputs(outputs);
 xmr\_array\_iterator\_t iter\_im1(im1);
 xmr\_array\_iterator\_t iter\_im2(im2);
 xmr\_array\_iterator\_t iter\_im3(im3);
 xmr\_array\_iterator\_t iter\_a(outputs);
 xmr\_array\_iterator\_t iter\_b(outputs);
 xmr\_array\_iterator\_t iter\_c(outputs);
 xmr\_array\_iterator\_t iter\_y(outputs);
 sc\_trace(tf, iter\_inputs, "inputs");
 sc\_trace(tf, iter\_im1,