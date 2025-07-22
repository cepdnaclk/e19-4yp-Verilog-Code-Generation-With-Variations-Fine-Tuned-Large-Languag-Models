```module hex7seg_le (input wire [3:0] x, output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g); // Logic equations for each segment (active high assumed) assign a_to_g[6] = ~x[3] & ~x[2] & ~x[1] & x[0] // a (segment index 6) | ~x[3] & x[2] & ~x[1] & ~x[0] | x[3] & x[2] & ~x[1] & x[0] | x[3] & ~x[2] & x[1] & x[0]; assign a_to_g[5] = x[2] & x[1] & ~x[0] // b (segment index 5) | x[3] & x[1] & x[0] | ~x[3] & x[2] & ~x[1] & x[0] | x[3] & x[2] & ~x[1] & ~x[0]; assign a_to_g[4] = ~x[3] & ~x[2] & x[1] & ~x[0] // c (segment index 4) | x[3] & x[2] & x[1] | x[3] & x[2] & ~x[0]; assign a_to_g[3] = ~x[3] & ~x[2] & ~x[1] & x[0] // d (segment index 3) | ~x[3] & x[2] & ~x[1] & ~x[0] | x[3] & ~x[2] & x[1] & ~x[0] | x[2] & x[1] & x[0]; assign a_to_g[2] = ~x[3] & x[0] // e (segment index 2) | ~x[3] & x[2] & ~x[1] | ~x[2] & ~x[1] & x[0]; assign a_to_g[1] = ~x[3] & ~x[2] & x[0] // f (segment index 1) | ~x[3] & ~x[2] & x[1] | ~x[3] & x[1] & x[0] | x[3] & x[2] & ~x[1] & x[0]; assign a_to_g[0] = ~x[3] & ~x[2] & ~x[1] // g (segment index 0) | x[3] & x[2] & ~x[1] & ~x[0] | ~x[3] & x[2] & x[1] & x[0]; endmodule

```

**Explanation**

When you specify a part select for x, it will only look at the indices of x. The value of x will not be used. If you don't want this, you have to do some other logic to prevent the value of x from being used.

You can do this using an indexed part select:

```
`ifdef x[0]
...
`endif

```

but because it's `ifdef`, it's always evaluated, so you have to do the following:

```
`ifdef x[0]
assign a_to_g[0] = x[0] & ~x[1] & ~x[2] & ~x[3]
`endif
`ifdef x[1]
assign a_to_g[0] = ~x[0] & x[1] & ~x[2] & ~x[3]
`endif
`ifdef x[2]
assign a_to_g[0] = ~x[0] & ~x[1] & x[2] & ~x[3]
`endif
`ifdef x[3]
assign a_to_g[0] = ~x[0] & ~x[1] & ~x[2] & x[3]
`endif

```

And so on. You can do this using a generate block, which will be evaluated only once, and then the value of x will not be used, but will only be used to make sure that the output gets assigned correctly.

But you can also do this using a case, like so:

```
case (x)
3'b 0:    a_to_g[0] = 1'b0;
3'b 1:    a_to_g[0] = 1'b1;
3'b 2:    a_to_g[0] = 1'b0;
3'b 3:    a_to_g[0] = 1'b1;
3'b 4:    a_to_g[0] = 1'b0;
3'b 5:    a_to_g[0] = 1'b1;
3'b 6:    a_to_g[0] = 1'b0;
3'b 7:    a_to_g[0] = 1'b1;
3'b 8:    a_to_g[0] = 1'b0;
3'b 9:    a_to_g[0] = 1'b1;
default:  a_to_g[0] = 1'b0;
endcase

```

As you can see, this is much less compact, but it's more direct and the value of x is not used at all.

If you want a more compact form but more readable, you can add a special case of the default, like so:

```
case (x)
3'b 0:    a_to_g[0] = 1'b0;
3'b 1:    a_to_g[0] = 1'b1;
3'b 2:    a_to_g[0] = 1'b0;
3'b 3:    a_to_g[0] = 1'b1;
3'b 4:    a_to_g[0] = 1'b0;
3'b 5:    a_to_g[0] = 1'b1;
3'b 6:    a_to_g[0] = 1'b0;
3'b 7:    a_to_g[0] = 1'b1;
3'b 8:    a_to_g[0] = 1'b0;
3'b 9:    a_to_g[0] = 1'b1;
default:  a_to_g[0] = 1'b0;
endcase

```

Again, this is longer but still much more readable.

But of course, if you want to make it even shorter, you can also just write the logic in the generate block, without using any case statements at all:

```
generate
for (i=0; i<10; i=i+1) begin : case_part

    if (i==0)
        a_to_g[0] = 1'b0;
    else if (i==1)
        a_to_g[0] = 1'b1;
    else if (i==2)
        a_to_g[0] = 1'b0;
    else if (i==3)
        a_to_g[0] = 1'b1;
    else if (i==4)
        a_to_g[0] = 1'b0;
    else if (i==5)
        a_to_g[0] = 1'b1;
    else if (i==6)
        a_to_g[0] = 1'b0;
    else if (i==7)
        a_to_g[0] = 1'b1;
    else if (i==8)
        a_to_g[0] = 1'b0;
    else if (i==9)
        a_to_g[0] = 1'b1;

end : case_part
endgenerate

```

Now, if you really want to be super-compact, you can use a function, like so:

```
module hex7seg(input wire [3:0] x, output reg [6:0] a_to_g);

    logic [3:0] x; // the value of x is not used, just used to make sure the outputs are correct
    assign x = x;
    function logic [3:0] digit(input  logic digit);
        case (digit)
            0:  return '0;
            1:  return '1;
            2:  return