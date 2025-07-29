```Verilog
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = 
case (s)
3'b000: c[0];
3'b001: c[1];
3'b010: c[2];
3'b011: c[3];
default: 0;
endcase
endmodule
```
### Simulation:
![simulation](https://github.com/h-ayat/fpga-study/blob/main/week4/images/simulation.png)
### Tips:
#### Tips 1:
If you want to select a single bit from a vector of bits, use this line:
```Verilog
assign z = a[index];
```
#### Tips 2:
You can use the following line to select a vector of bits from a vector of bits:
```Verilog
assign z = a[index:index+width-1];
```
### Simplification:
#### Improvement 1:
Rewrite