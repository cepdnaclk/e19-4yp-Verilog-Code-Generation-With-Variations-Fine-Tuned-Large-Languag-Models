```verilog
// 4-bit D latch.
module dlatch(en,d,q,qb);
parameter W=4; // DATA WIDTH
input en,d [W-1:0];
output reg q[W-1:0],qb[W-1:0];
reg state;
// Sequential logic
always @(posedge clk,negedge rst_n)
begin
// This is the sequential reset.
if (!rst_n)
begin
q<='0;
qb<='1;
state<=1'b0;
end
else
begin
if (en)
begin
state<=1'b1;
if (state) q<=d; // Only in synchronous state
else qb<=d; // Only in synchronous state
end
else // Enable = 0, latch is disabled
begin
state<=1'b0;
q<=q;
qb<=qb;
end
end
end
endmodule
```
This code is more efficient because the `if` statements are reduced to one condition and two assignments to avoid an `else` block. This is a good approach especially when there is a possibility of using multiple `if` statements in the sequential logic.
### References:
* [`always` block](http://www.verilog.com/Verilog_Blocks.html#always_block)
* [`if` statement](http://www.verilog.com/Verilog_Blocks.html#if_block)
* [`always` block with no sensitivity list](http://www.verilog.com/Verilog_Blocks.html#always_block_no_sens_list)
* [`always` block with synchronous reset](http://www.verilog.com/Verilog_Blocks.html#always_block_sync_reset)
* [`always` block with combinational logic](http://www.verilog.com/Verilog_Blocks.html#always_block_combinational)
### Key Takeaways:
* Use multiple `if` statements if the outcome of each can be reduced to one `if-elseif-else` block.
* Use multiple `if` statements only when there's an inherent possibility of using multiple assignments in the sequential logic.
---
## 7.1.17
### Question:
```verilog
module pn_counter (clk,rst,u,z,y,x);
input clk,rst;
output reg [3:0] u,z,y,x;
wire [3:0] s;
always @(posedge clk,negedge rst)
begin
if (!rst)
begin
u[3:0]=4'b0000;
z[3:0]=4'b0000;
y[3:0]=4'b0000;
x[3:0]=4'b0000;
end
else
begin
s[3:0]=u[3:0]+z[3:0]+y[3:0]+x[3:0];
if (s[3]==1)
begin
u[3:0]=4'b0000;
z[3:0]=4'b0001;
y[3:0]=4'b0000;
x[3:0]=4'b0000;
end
else if (s[2]==1)
begin
u[3:0]=4'b0000;
z[3:0]=4'b0000;
y[3:0]=4'b0001;
x[3:0]=4'b0000;
end
else if (s[1]==1)
begin
u[3:0]=4'b0000;
z[3:0]=4'b0000;
y[3:0]=4'b0000;
x[3:0]=4'b0001;
end
else if (s[0]==1)
begin
u[3:0]=4'b0001;
z[3:0]=4'b0000;
y[3:0]=4'b0000;
x[3:0]=4'b0000;
end
end
endmodule
```
### Options:
a. The program counter doesn't work as expected.
b. The `else if (s[1]==1)` statement in the sequential logic causes the counter to be incompatible with the combinational logic.
c. The counter works as expected.
### Answer:
b. The `else if (s[1]==1)` statement in the sequential logic causes the counter to be incompatible with the combinational logic.
### Explanation:
The design doesn't work because the counter isn't compatible with the combinational logic. The `wire` `s` in the sequential logic is undefined.
### References:
* [`always` block](http://www.verilog.com/Verilog_Blocks.html#always_block)
* [`if` statement](http://www.verilog.com/Verilog_Blocks.html#if_block)
* [`else` statement](http://www.verilog.com/Verilog_Blocks.html#else_block)
* [`always` block with synchronous reset](http://www.verilog.com/Verilog_Blocks.html#always_block_sync_reset)
* [`always` block with combinational logic](http://www.verilog.com/Verilog_Blocks.html#always_block_combinational)
### Key Takeaways:
* Use combinational logic only in `always` blocks with a synchronous reset.
---
## 8.1.1
### Question:
```verilog
module nbit_up_counter_nrst (clk,rst,n,q);
input clk,rst,n;
output [3:0] q;
wire [3:0] q,s;
wire c;
assign s=q+1'b1;
assign c=s[3];
always @(posedge clk,negedge rst)
begin
if (!rst) begin
q=4'b0000;
end
else if (!n) begin
q=q;
end
else begin
q=s;
end
end
endmodule
```
### Options:
a. The `n` input is not used.
b. The `n` input is used to stop incrementing the counter.
c. The `n` input is used to load the counter.
d. The `n` input is used to reset the counter.
### Answer:
c. The `n` input is used to load the counter.
### Explanation:
The `n` input is used to load the counter. When `n` is `1` the `q` output changes to the `s` value and `n` is `0` the `q` output changes to the `q` value.
### Key Takeaways:
* When n is `1` and n is `0` the `q` output changes to `s` and `s` value.
---
## 8.1.10
### Question:
```verilog
module d_flip_flop(clk,rst,d,q);
input clk,rst,d;
output reg q;
always @(posedge clk,negedge rst)
begin
if (!rst) begin
q=1'b0;
end
else if (!d) begin
q=1'b0;
end
else begin
q=1'b1;
end
end
endmodule
```
### Options:
a. The `d` input is not used.
b. The `d` input is used to set the output to `0`.
c. The `d` input is used to set the output to `1`.
### Answer:
c. The `d` input is used to set the output to `1`.
### Explanation:
The `d` input is used to set the output `q` to `1`.
### Key Takeaways:
* When `d` is `1` the output `q` is set to `1`.
---
## 8.2.1
### Question:
```verilog
module d_latch(rst,d,q,qb);
input