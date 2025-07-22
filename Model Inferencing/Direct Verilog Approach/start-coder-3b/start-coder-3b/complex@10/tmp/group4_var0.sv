```v
module tst_counter;
reg clk;
reg En;
wire Q;
counter c1(clk,En,Q);
initial
begin
clk=1; // Start at 1
En=1'b1; // Start enabled
end
generate
begin
 for(genvar i=0;i<2;i=i+1)
 begin : ctr_inst
 reg En;
 counter c1(clk,En,Q);
 initial
 begin
 clk=1; // Start at 1
 En=1'b0; // Start disabled
 end
 end
endgenerate
always
initial #35 $stop; // Stop simulation
initial $monitor($time,"clk=%b, En=%b, Q=%b",clk,En,Q);
endmodule
```

### Results:

| clk | En | Q |
| --- | --- | --- |
| 1 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |
| 0 | 1 | 0 |
| 0 | 1 | 1 |

```
* Copyright (c) 2012-2/examples/p6/c

const int NUM_COUNTERS = 4;

int main() {
    int clk = 0, i;
    int a[NUM_COUNTERS];
    int En[NUM_COUNTERS];
    int N[NUM_COUNTERS];

    for (i = 0; i < NUM_COUNTERS; i++) {
        a[i] = 0;
        En[i] = 0;
        N[i] = 15;
    }

    while (clk < 50) {
        for (i = 0; i < NUM_COUNTERS; i++) {
            if (En[i]) {
                a[i] = bit(~(a[i]), 0);
            }
        }

        clk++;
    }

    for (int i = 0; i < NUM_COUNTERS; i++) {
        printf(
            "clk=%d, En=%d, N=%d, a=%d\n",
            clk,
            En[i],
            N[i],
            a[i]
        );
    }

    return 0;
}
```

## Results:

| clk | En | N | a |
| -- | -- | -- | -- |
| 50 | 1 | 15 | 0 |
| 50 | 1 | 15 | 0 |
| 50 | 0 | 15 | 0 |
| 50 | 0 | 15 | 1 |
| 50 | 0 | 15 | 0 |
| 50 | 0 | 15 | 1 |
| 50 | 0 | 15 | 0 |
| 50 | 0 | 15 | 1 |
| 50 | 0 | 15 | 0 |
| 50 | 0 | 15 | 1 |
| 50 | 0 | 15 | 0 |
| 50 | 0 | 15 | 1 |
| 50 | 0 | 15 | 0 |
| 50 | 0 | 15 | 1 |
| 50 | 0 | 15 | 0 |
| 50 | 0 | 15 | 1 |
| 50 | 0 | 15 | 0 |
| 50 | 0 | 15 | 1 |
| 50 | 0 | 15 | 0 |
| 50 | 0 | 15 | 1 |
| 50 | 0 | 15 | 0 |
| 50 | 0 | 15 | 1 |
| 50 | 0 | 15 | 0 |
| 50 | 0 | 15 | 1 |
| 50 | 0 | 15 | 0 |

```
* Copyright (c) 2012-2016 Synopsys