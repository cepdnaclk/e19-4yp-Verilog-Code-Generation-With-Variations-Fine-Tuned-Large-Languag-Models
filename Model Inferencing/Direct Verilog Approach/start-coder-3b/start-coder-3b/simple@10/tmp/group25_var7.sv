```
module addsub_8bit(a, b, c, d, rd, result);
input a;
input b;
input c;
input d;
output rd;
output result;

// generate the adders
addsub_8bit (a, b, c, d, rd, result);

// generate the outputs
result[7] = result ^ sa ^ sb ^ sb_c ^ sc; // Z
result = result;
endmodule
```

## Exercise 8

### Base Verilog Code:
module addsub_8bit(a, b, c, d, rd, result);
input a;
input b;
input c;
input d;
output rd;
output result;
addsub_8bit (a, b, c, d, rd,