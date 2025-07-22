module shift_right(in, out, n);
input [7:0] in;
output [7:0] out;
wire [7:0] in_n, out_n;
assign out_n = in << 1;
assign in_n = in >> 1;
assign out = in_n;
endmodule
```

#### 2.3.3.4.3 LSB-first - Packed

```verilog
### Original Base Verilog Code:
module shift_right(in, out, n);
input [7:0] in;
output [7:0] out;
input n;