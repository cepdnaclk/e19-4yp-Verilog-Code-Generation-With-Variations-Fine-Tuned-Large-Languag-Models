module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire[1:0] a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1[1],a[1],a[0]), g2(b1[1],b[1],b[0]) // packed slice
// Behavioral NOR logic sensitive to AND outputs
always@(a1[0] or b1[0])
o = ~ (a1[0] or b1[0]);
endmodule

```



```python

```

#### Add a 3-to-8 Decoder

##### Module Definition and Verilog Code

``` python
# 3-to-8 Decoder

module d3to8_0(d0,d1,d2,d,e,s);
input d0,d1,d2;
output [2:0] d,s;
wire [1:0] e;

or g0(d[0],d0,d1,d2), // d0 = d0 or d1 or d2;
or g1(d[1],d0,d1,d2); // d1 = d0 or d1 or d2;
or g2(d[2],d0,d1,d2); // d2 = d0 or d1 or d2;

nand g3(e[0],d[0],d[1],d[2]), // e0 = ~(d0 and d1 and d2);
nand g4(e[1],d[0],d[1],d[2]); // e1 = ~(d0 and d1 and d2);

and g5(s[0],d[0],d[1],d[2]), // s0 = d0 and d1 and d2;
and g6(s[1],d[0],d[1],d[2]), // s1 = d0 and d1 and d2;
and g7(s[2],d[0],d[1],d[2]), // s2 = d0 and d1 and d2;
and g8(s[3],d[0],d[1],d[2]); // s3 = d0 and d1 and d2;

endmodule

```

``` verilog

# 3-to-8 Decoder

module d3to8_0(d0,d1,d2,d,e,s);
input d0,d1,d2;
output [2:0] d,s;
wire [1:0] e;

or g0(d[0],d0,d1,d2), // d0 = d0 or d1 or d2;
or g1(d[1],d0,d1,d2); // d1 = d0 or d1 or d2;
or g2(d[2],d0,d1,d2); // d2 = d0 or d1 or d2;

nand g3(e[0],d[0],d[1],d[2]), // e0 = ~(d0 and d1 and d2);
nand g4(e[1],d[0],d[1],d[2]); // e1 = ~(d0 and d1 and d2);

and g5(s[0],d[0],d[1],d[2]), // s0 = d0 and d1 and d2;
and g6(s[1],d[0],d[1],d[2]), // s1 = d0 and d1 and d2;
and g7(s[2],d[0],d[1],d[2]), // s2 = d0 and d1 and d2;
and g8(s[3],d[0],d[1],d[2]); // s3 = d0 and d1 and d2;

endmodule

```

##### Source Code

``` python
# 3-to-8 Decoder

module d3to8_0(d0,d1,d2,d,e,s);
input d0,d1,d2;
output [2:0] d,s;
wire [1:0] e;

or g0(d[0],d0,d1,d2), // d0 = d0 or d1 or d2;
or g1(d[1],d0,d1,d2); // d1 = d0 or d1 or d2;
or g2(d[2],d0,d1,d2); // d2 = d0 or d1 or d2;

nand g3(e[0],d[0],d[1],d[2]), // e0 = ~(d0 and d1 and d2);
nand g4(e[1],d[0],d[1],d[2]); // e1 = ~(d0 and d1 and d2);

and g5(s[0],d[0],d[1],d[2]), // s0 = d0 and d1 and d2;
and g6(s[1],d[0],d[1],d[2]), // s1 = d0 and d1 and d2;
and g7(s[2],d[0],d[1],d[2]), // s2 = d0 and d1 and d2;
and g8(s[3],d[0],d[1],d[2]); // s3 = d0 and d1 and d2;

endmodule

```

``` verilog

# 3-to-8 Decoder

module d3to8_0(d0,d1,d2,d,e,s);
input d0,d1,d2;
output [2:0] d,s;
wire [1:0] e;

or g0(d[0],d0,d1,d2), // d0 = d0 or d1 or d2;
or g1(d[1],d0,d1,d2); // d1 = d0 or d1 or d2;
or g2(d[2],d0,d1,d2); // d2 = d0 or d1 or d2;

nand g3(e[0],d[0],d[1],d[2]), // e0 = ~(d0 and d1 and d2);
nand g4(e[1],d[0],d[1],d[2]); // e1 = ~(d0 and d1 and d2);

and g5(s[0],d[0],d[1],d[2]), // s0 = d0 and d1 and d2;
and g6(s[1],d[0],d[1],d[2]), // s1 = d0 and d1 and d2;
and g7(s[2],d[0],d[1],d[2]), // s2 = d0 and d1 and d2;
and g8(s[3],d[0],d[1],d[2]); // s3 = d0 and d1 and d2;

endmodule

```

##### Result:

![image-20201222143528820](https://tva1.sinaimg.cn/large/007S8ZIlly1gge2r52k7gj31kw12a7wh.jpg)

##### Variation:

``` python

# 3-to-8 Decoder

module d3to8_0(d0,d1,d2,d,e,s);
input d0,d1,d2;
output [2:0] d,s;
wire [1:0] e;

or g0(d[0],d0,d1,d2), // d0 = d0 or d1 or d2;
or g1(d[1],d0,d1,d2); // d1 = d0 or d1 or d2;
or g2(d[2],d0,d1,d2); // d2 = d0 or d1 or d2;

nand g3(e[0],d[0],d[1],d[2]), // e0 = ~(d0 and d1 and d2);
nand g4(e[1],d[0],d[1],d[2]); // e1 = ~(d0 and d1 and d2);

and g5(s[0],d[0],d[1],d[2]), // s0 = d0 and