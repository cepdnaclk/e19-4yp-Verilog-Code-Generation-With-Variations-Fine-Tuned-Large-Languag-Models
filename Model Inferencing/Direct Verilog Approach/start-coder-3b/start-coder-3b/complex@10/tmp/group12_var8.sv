module dffalter_tst(); 
reg di,clk,clr,pr;
wire q, qb;
// This is the new packed array
pack1_t d_pack_array[0:8] = '{di[7:0], di[15:8], di[23:16], di[31:24]};
// The remaining code is the same
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di=1'b0;
end
always
begin
clr=1'b0;
end
always # 4 di =~di;
always #16 pr=1'b1;
always #20 pr =1'b0;
initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ", $time,clk,clr,pr,di,q);
initial #46 $stop;
endmodule
### Result:
![Figure 19](Images/Fig19.png)
/Verilog/Module_Instantiation/readme.md
# Module Instantiation
*The following examples are demonstrating module instantiations in Verilog*

### Introduction
The syntax for instantiating/using modules in Verilog is very similar to that of using IP. A module is instantiated just like any other IP, for example:
<p align="center">
  <img src="Images/Inst.PNG">
</p>
The component instantiation is similar in that it references the following format:
<p align="center">
  <img src="Images/Component.PNG">
</p>

### Example 1:
In this example we will look at using the `shift_gate` module to create a simple shift left implementation. This module implements the basic 2-bit left shift, which means if the data is shifted once to the left, it will be multiplied by 2 and shifted out the right-most bit. We will have 4 shift_gate modules to implement the basic 4-bit shift left operation. We can implement the shift left for 4 bits in the following way:
<p align="center">
  <img src="Images/shift_gate_4bit_leftshift.png">
</p>

### Example 2:
In this example we will use the `dec` module to create a simple Decrementer. This module implements the basic 4-bit addition with carry. As we look at the module, we see it has 2 input ports, in_data and in_carry, to handle the logic of the addition and an output port out_data. In this case we only want to show the logic of the module, not the instantiation, so the module instantiation is not shown. The module will have 4 instances of `inc` modules. We will also need to instantiate 4 `dec` module as shown below.
<p align="center">
  <img src="Images/dec_module.png">
</p>

### Code:
*The following code is the module that is implementing the behavior of the `inc` module. This code is not shown.*
```verilog
module inc(
  input clk,
  input in_carry,
  input in_data,
  output sig,
  output carry
);
reg[3:0] sig;
reg carry, data;

always_ff @(posedge clk) begin
  if (carry) begin
    sig <= sig[3:0] + 4'd1;
  end else begin
    sig <= sig + 4'd1;
  end
  if (sig > 4'd15) begin
    sig <= sig[3:0] - 4'd16;
    carry <= 1'b1;
  end else begin
    carry <= 1'b0;
  end
end
endmodule
```
### Code:
*The following code is the module that is implementing the behavior of the `dec` module. This code is not shown.*
```verilog
module dec(
  input clk,
  input in_data,
  output out_data
);
reg[3:0] out_data;

always_ff @(posedge clk) begin
  out_data <= in_data - 4'd1;
end
endmodule
```
*The following code is the module that is implementing the behavior of the `shift_gate` module. This code is not shown.*
```verilog
module shift_gate(
  input [3:0] in_data,
  input in_shift,
  output [3:0] out_data
);
reg[3:0] out_data;

always_ff @(posedge in_shift) begin
  out_data <= in_data << 1;
end
endmodule
```
*The following code is the module that is implementing the behavior of the `dff` module. This code is not shown.*
```verilog
module dff(
  input clk,
  input enable,
  input in_data,
  output out_data
);
wire s;
wire q;

always_ff @(posedge clk) begin
  if (enable)
    out_data <= in_data;
end

always_ff @(posedge s, posedge q) begin
  if (s) begin
    out_data <= q;
  end
end
endmodule
```
*The following code is the module that is implementing the behavior of the `mux` module. This code is not shown.*
```verilog
module mux(
  input [3:0] sel,
  input [3:0] in0,
  input [3:0] in1,
  output [3:0] out
);
wire i0, i1;

assign i0 = {sel? in1[3:0] : in0[3:0]};
assign i1 = {sel? in0[3:0] : in1[3:0]};

assign out = {i0, i1};
endmodule
```
*The following code is the module that is implementing the behavior of the `inc_mux` module. This code is not shown.*
```verilog
module inc_mux(
  input clk,
  input [3:0] in_a,
  input [3:0] in_b,
  output [3:0] out_a,
  output [3:0] out_b
);
wire enable;
wire out_a, out_b;

always_ff @(posedge clk) begin
  if (in_b[0] && in_b[1] && in_b[2] && in_b[3]) begin
    enable = 1;
  end else begin
    enable = 0;
  end
end

mux mux_a(
 .sel(enable),
 .in0(in_a),
 .in1(out_a),
 .out(out_a)
);

dff dff_a(
 .clk(clk),
 .enable(enable),
 .in_data(in_a),
 .out_data(out_a)
);
mux mux_b(
 .sel(enable),
 .in0(in_b),
 .in1(out_b),
 .out(out_b)
);

dff dff_b(
 .clk(clk),
 .enable(enable),
 .in_data(in_b),
 .out_data(out_b)
);
endmodule
```
*The following code is the module that is implementing the behavior of the `dec_inc` module. This code is not shown.*
```verilog
module dec_inc(
  input clk,
  input in_c,
  input in_d,
  input in_e,
  output out_c,
  output out_d,
  output out_e
);
wire a, b, c, d, e;

assign a = in_c[0] && in_c[1] && in_c[2] && in_c[3];
assign b = in_d[0] && in_d[1] && in_d[2] && in_d[3];
assign c = in_e[0] && in_e[1] && in_e[2] && in_e[3];

assign d = a ^ b ^ c;
assign e = ~d;

inc_mux inc_mux_a(
 .clk(clk),
 .in_a(in_c),
 .in_b(in_d),
 .out_a(out_c),
 .out_b(out_d)
);

mux mux_a(
 .sel(e),
 .in0(out_c),
 .in1(in_c),
 .out(out_c)
);
mux mux_b(
 .sel(d),
 .in0(out_d),
 .in1(in_d),
 .out(out_d)
);
mux mux_c(
 .sel(c),
 .in0(out_e),
 .in1(in_e),
 .out(out_