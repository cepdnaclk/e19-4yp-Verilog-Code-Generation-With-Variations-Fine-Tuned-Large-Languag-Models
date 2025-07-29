module aoi2(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1; // Intermediate signals
// Dataflow assignments for AND, OR, and NOT operations
assign e = a && b;
assign f = c && d;
assign g1 = e || f;
assign g = ~g1; // Final AOI output
initial begin
$display($sformatf("a = %0h, b = %0h, c = %0h, d = %0h", a, b, c, d));
end
function [3:0] get_num;
input [3:0] num;
begin
get_num = num == 0? 4'h00 : 4'h01 << num;
end
endfunction
initial g = get_num(a) | get_num(b) & (get_num(c) | get_num(d));
endmodule
### Variation Summary
This variation shows using a function to index an "initial" value.
### Verification Steps

1. Compile and run the code:

```
*****  COMPILE *****
AOI2.v
*****  RUN *****
a = 1, b = 0, c = 1, d = 0
a = 1, b = 0, c = 0, d = 0
```

### Suggested Train:
This variation can be executed using [AOI2-Base](https://github.com/jlpteaching/Verilog_and_FPGA_workshop/blob/master/verilog/aoi2/AOI2.v).

### Final Verilog Code
```
module aoi2(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1; // Intermediate signals
// Dataflow assignments for AND, OR, and NOT operations
assign e = a && b;
assign f = c && d;
assign g1 = e || f;
assign g = ~g1; // Final AOI output
function [3:0] get_num;
input [3:0] num;
begin
get_num = num == 0? 4'h00 : 4'h01 << num;
end
endfunction
initial g = get_num(a) | get_num(b) & (get_num(c) | get_num(d));
endmodule
```

### References:
[IEEE 754-2008 Floating Point Standard](http://www.eecg.toronto.edu/~amza/www.project