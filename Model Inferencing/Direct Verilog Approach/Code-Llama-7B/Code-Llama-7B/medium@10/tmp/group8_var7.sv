module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation
endmodule
// Modified code
module dec2_4beh(o,i);
input [1:0]i;
output [3:0]o;
wire [3:0]w;
assign o[3:2] = i[1]? {1'b1,i[0]} : {1'b0,i[0]};
assign o[1:0] = w[1:0];
assign w[1:0] = i[1]? {1'b1,i[0]} : {1'b0,i[0]};

endmodule
### Simulation Setup:
```
initial
begin
$dumpfile("dec2_4beh.vcd");
$dumpvars(0,tst_dec2_4beh);
tst_dec2_4beh dut();
i =2'b00;
#16 i =2'b11;
#16 i =2'b01;
#16 i =2'b10;
#16 i =2'b11;
end
```
### Simulation Testing:
```
$vlog tst_dec2_4beh.v
$vsim tst_dec2_4beh -voptargs="+acc"
initial
begin
$dumpfile("dec2_4beh.vcd");
$dumpvars(0,tst_dec2_4beh);
tst_dec2_4beh dut();
i =2'b00;
#16 i =2'b11;
#16 i =2'b01;
#16 i =2'b10;
#16 i =2'b11;
end
$run 100
```
### Simulation Result:
<p align="center">
  <img src="http://ws1.sinaimg.cn/large/006tBeITgy1frx1v52xwgj30m20b2dgl.jpg"/>
</p>

### Discussion
<p align="center">
  <img src="http://ws1.sinaimg.cn/large/006tBeITgy1frx1v4m9x5j307m02y3yf.jpg"/>
</p>

> 基本情况下，indexed part select语句和直接地址的select语句相同，但是当indexed part select用于if语句的条件成立判定时，会出现死逻辑。

> 在if条件成立时，我们可以观察到o=11，因为i = 3，不符合dec2_4beh模块的设计。而在if条件不成立时，输出o = 00。因为i = 0.

> 那么，如果我们把o[3:2]和o[1:0]拆分出来，每个时钟脉冲的整个值并不一样。

> 因此，indexed part select可以与单独的wire和一些连接在一起的wire组合，但是不能用于if语句。

## Pipelining
### Base Verilog Code:
```
module dec2_4beh(o,i);
input [1:0]i;
output [3:0]o;
assign o[3:2] = i[1]? {1'b1,i[0]} : {1'b0,i[0]};
assign o[1:0] = i[1]? {1'b1,i[0