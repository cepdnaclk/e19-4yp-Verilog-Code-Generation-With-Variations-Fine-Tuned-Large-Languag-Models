module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
generate
for (j = 0; j < 4; j = j+1)
if(j == 4)
int_q = {rr_inst[j], q};
else if(j == 0)
int_q = q;
else
int_q = {q[j-1:0], q[j+3:4]};
endgenerate
endmodule

# How to write sequential/combinational logic in Verilog

In a previous post, I talked about how to write sequential logic in Verilog. In this post, I’ll go over how to write combinational logic in Verilog and illustrate this with an example.

## Combinational Logic

Combinational logic is the simplest type of logic that you’ll encounter in Verilog. It is the most common type of logic in Verilog and is used primarily in sequential logic. Combinational logic in Verilog acts on input signals and produces output signals. If the output of a combinational logic is depended on the output of another combinational logic or the input of another combinational logic, the output of the first signal will be affected by the second signal. For example, if the output of one combinational logic depends on the output of another combinational logic, the output of the first combinational logic will be affected. Let’s look at an example:

module srg( input [3:0] data, input clk, rst, output reg [3:0] q );

reg [3:0] int_q;

always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end

always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end

endmodule`

In the above example, the output of the combinational logic is dependent on the input of `q` and the output of the combinational logic is depended on the output of the other combinational logic. Notice that the output of `q` is depended on the output of the other combinational logic, `int_q`. Because `int_q` is depended on by `q`, `int_q` will be affected by `q`.

Next, let’s look at another example.

module srg( input [3:0] data, input clk, rst, output reg [3:0] q );

reg [3:0] int_q;

always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end

always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q[3:0];
end

endmodule`

In the above example, the output of the combinational logic is a specific slice of the input of `q`, `q[3:0]`. This is the same as `q[3:0]`, where the output of the combinational logic depends on the input of `q` and `q` is depended on by the output of the other combinational logic. Notice that the output of `q` is depended on the output of the other combinational logic, `int_q`. Thus, the input of `q` is affected, and the output of the other combinational logic will be affected.

## Conclusion

Combinational logic is the next step after sequential logic in Verilog. In this post, I showed an example of how to write combinational logic in Verilog and illustrated how it works. This is the final post in the series, so I’ll finish up with some resources for further learning about combinational logic and Verilog.

### Related Posts

I often find myself writing code that I can verify on a computer using an instruction set simulator (ISS). This allows me to check that my code is correct before I put it into hardware. One ISS that I use regularly is the Verilog Instruction Set Simulator (VISS). This allows me to check that my code is correct and that my Verilog code generates the correct hardware. In this post, I’ll show an example of how to write a Shift Register using VISS.

### VISS

First, we need to install VISS in our computer. To install VISS, you can download the latest version of VISS for Windows, Mac, or Linux from the VISS web page. Once you follow the install instructions, run VISS.

### Shift Register

Next, we need to write our Shift Register in Verilog. In the following Verilog code, I’ll use a register to store the internal value of the shift register, and I’ll use a combinational logic to generate the output.

module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
endmodule`

### SRS Code

To get the input of the shift register to be {1’d1}, I’ll use a constant array and wrap the instantiation in a generate block to create a constant array `rr`. I’ll also use a constant array to store the internal value of the shift register `rr_inst`. Then, I’ll assign the internal state of the shift register using `rr_inst`.

### Input Code

Next, I’ll create a testbench in VISS to use to test that the shift register generates the correct output. The following code will create a shift register using an input of `d_in`, a clock signal `clk`, a shift register `sr`, a slicing register `sl`, a load register `ld`, and a reset register `rst`. The internal state of the shift register will be {1’d1}.

`testbench`
`module shift_reg_tb ( testbench_type tb );`
`parameter testbench_type = "shift_reg";`
`reg [3:0] d_in;`
`reg clk;`
`reg sl;`
`reg ld;`
`reg rst;`
`parameter s_cnt = 1'b0;`
`parameter sr = 1'b0;`

`initial begin`
`d_in = {1’d1};`
`rst = 1’b1;`
`#300 clk = 0;`
`#150 clk = 1;`
`#100 clk = 0;`
`#100 rst = 0;`
`#50 rst = 1;`
`end`

`initial begin`
`d_in = {1’d0};`
`rst = 1’b1;`
`#300 clk = 0;`
`#150 clk = 1;`
`#100 clk = 0;`
`#100 rst = 0;`
`#50 rst = 1;`
`end`

`initial begin`
`d_in = {1’d0};`
`rst = 1’b1;`
`#300 clk = 0;`
`#150 clk = 1;`
`#100 clk = 0;`
`#100 rst = 0;`
`#50 rst = 1;`
`end`

`initial begin`
`d_in = {1’d0};`
`rst = 1’b1;`
`#300 clk = 0;`
`#150 clk = 1;`
`#100 clk = 0;`
`#100 rst = 0;`
`#50 rst = 1;`
`end`

`initial begin`
`d_in = {