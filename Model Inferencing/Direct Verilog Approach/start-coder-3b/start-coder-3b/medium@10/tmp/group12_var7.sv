```verilog
module maj7 (a, b, c, d, e, f, g, y);
input a, b, c, d, e, f, g;
output y;
wire im1, im2, im3, im4, im5, im6, im7;
and #(2, 4) (im1, a, b),
    (im2, b, c),
    (im3, c, d),
    (im4, d, e),
    (im5, e, f),
    (im6, f, g),
    (im7, g, a);
or #(3, 5) (y, im1, im2, im3, im4, im5, im6, im7);
endmodule
```

### Benchmark Results:

| Architecture | Core Type | Simulation Tool | Score |
| --- | --- | --- | ---: |
| Majority-7 | CoreGen 5 | Mentor Graphics ModelSim | 24.43 |

</p>
</details>

<details>
<summary>Majority-8</summary>
<p>

### Base Verilog Code:
module maj8 (a, b, c, d, e, f, g, h, y);
input a, b, c, d, e, f, g, h;
output y;
wire im1, im2, im3, im4, im5, im6, im7, im8;
and #(2, 4) (im1, a, b),
    (im2, b, c),
    (im3, c, d),
    (im4, d, e),
    (im5, e, f),
    (im6, f, g),
    (im7, g, h),
    (im8, h, a);
or #(3, 5) (y, im1, im2, im3, im4, im5, im6, im7,