```
module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
generate
for(int i=0;i<4;i++)
begin:inner
ctr_wt c1(a[i],clk,N,En);
end
endgenerate
initial
begin
clk=0; N=4'b1111; // Set limit to 15
En=1'b0; // Start disabled
end
always
initial #35 $stop; // Stop simulation
initial $monitor($time,"clk=%b, En=%b, N=%d, a=%d",clk,En,N,a); // Corrected format specifiers
endmodule
```
### Simulation Output:
```
# Simulation started at Wed Nov 12 16:43:21 2014
# Verilog Simulation 2012.09-SP2 compiled Nov 12 2014 21:37:56
# File: tst_ctr_wt.v
# Command line: tst_ctr_wt.do
#
# Executing Verilog design `tst_ctr_wt' from file `tst_ctr_wt.v' at `clk=0, En=x, N=x, a=x'
#
#
#
#
#
#
#
#
#
# Clock: clk = 0
# Enable: En = x
# N: N = x'
#  a = x'
#
#
#
#
#
#
#
#
#
# Clock: clk = 0
# Enable: En = 0
# N: N = 15'h1111
#  a = 15'h1111
#
#
#
#
#
#
#
#
#
#
# $stop simulation
```
# 图像缩放_插值 - qq_36106811的博客 - CSDN博客





2018年08月24日 22:14:37[qq_36106811](https://me.csdn.net/qq_36106811)阅读数：160








> 
原文链接：[www.cnblogs.com/zrtqsk/p/2574465.html](https://www.cnblogs.com/zrtqsk/p/2574465.html)



图像缩放中有两种缩放方式，一种是直接插值，另一种是使用双线性插值。




直接插值：

代码：

```
void ScaleImage(IplImage* src,IplImage* dst)
{
    int w = src->width;
    int h = src->height;
    int tw = dst->width;
    int th = dst->height;
    float x_ratio = (float)tw/w;
    float y_ratio = (float)th/h;
    int nx,ny;
    uchar * src_ptr;
    uchar * dst_ptr;

    for(int i = 0;i < th; i++)
    {
        ny = (int)(i*y_ratio);
        dst_ptr = (uchar*)dst->imageData + i*dst->widthStep;
        for(int j = 0; j < tw; j++)
        {
            nx = (int)(j*x_ratio);
            src_ptr = (uchar*)src->imageData + ny*src->widthStep + nx;
            dst_ptr[j] = src_ptr[0];
        }
    }
}
```

![](https://img-blog.csdn.net/20180824221209625?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTE4MTU0MDQ=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)




双线性插值：

代码：

```
//双线性插值
void InterpolateImage(IplImage * src,IplImage * dst)
{
    int w = src->width;
    int h = src->height;
    int tw = dst->width;
    int th = dst->height;
    float x_ratio = (float)tw/w;
    float y_ratio = (float)th/h;
    int nx,ny;
    int xoffset,yoffset;
    float wx,wy;
    uchar * src_ptr;
    uchar * dst_ptr;

    for(int i = 0;i < th; i++)
    {
        ny = (int)(i*y_ratio);
        yoffset = ny*src->widthStep;
        dst_ptr = (uchar*)dst->imageData + i*dst->widthStep;
        for(int j = 0; j < tw; j++)
        {
            nx = (int)(j*x_ratio);
            wx = nx - xoffset;
            xoffset = nx*src->widthStep;
            wy = ny - yoffset;
            yoffset = 0;
            src_ptr = (uchar*)src->imageData + yoffset + xoffset;
            src_ptr[0] = (uchar)(src_ptr[0]*(1 - wx) + src_ptr[src->widthStep]*wx);
            src_ptr[0] = (uchar)(src_ptr[src->widthStep]*(1 - wy) + src_ptr[src->widthStep*2]*wy);
        }
    }
}
```

![](https://img-blog.csdn.net/20180824221222552?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTE4MTU0MDQ=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)



# 2017年阿里巴巴百度大数据及人工智能大会（上海站）直播回顾 - 知乎
# 



> 
本文为《大数据与人工智能》作者撰写

**目录**

导读：阿里巴巴、百度和Google三大互联网巨头齐聚大会

本次大会以“大数据与人工智能”为主线，围绕新一代人工智能技术的发展，深入剖析，探讨与实践，旨在促进人工智能与大数据技术的发展。

![](https://pic2.zhimg.com/v2-33c450102c7a77b174f9a72e98a4d975_b.jpg)
本次大会为数据科学高峰会，在北京的大学城中举办。大会在“机器之心”公众号、“机器之心”微信公众号和“大数据与人工智能”微信公众号分别宣布，同时开放电子版，欢迎大家关注。
![](https://pic3.zhimg.com/v2-2714e367769546d44ad8c5fd32e518e0_b.jpg)![](https://pic3.zhimg.com/v2-000d51d2f8880795866d4063d73a0fa9_b.jpg)![](https://pic3.zhimg.com/v2-462396ba261c856f4d784103865b28f6_b.jpg)![](https://pic2.zhimg.com/v2-d1c42c2ef0c62ab6399207b8825e11b4_b.jpg)![](https://pic2.zhimg.com/v2-e41f4aa63a574e1cb32c99f21ba41f55_b.jpg)![](https://pic3.zhimg.com/v2-b2ac3c0145bd508b155825153049760b_b.jpg)![](https://pic4.zhimg.com/v2-e2849322e8294927671c89e660f521c6_b.jpg)![](https