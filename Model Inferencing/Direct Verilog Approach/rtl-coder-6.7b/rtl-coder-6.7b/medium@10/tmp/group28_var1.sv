```
module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
initial begin
o = ~(|{a1,b1});
end
endmodule
```

### Variant:

Use a simple boolean expression.

```
module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire [1:0] t;
assign t = a & b;
assign o = ~(t[0] | t[1]);
endmodule
```