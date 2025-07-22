module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk) case(di) 1'd0: do=1'd1; 1'd1: do=1'd0;endcase
endmodule
### Testbench Code:
module tb;
reg clk;
dff d1(.do(do),.di(di),.clk(clk));
initial
forever begin
di = 1;
#5 clk = ~clk;
#1 clk = ~clk;
end
endmodule
/Lab4/Lab4_1.md
# Lab4_1_1

### Code:
add
module add(A,B,C);
output [8:0] sum;
input [8:0] A,B;
reg [8:0] C;
always@(posedge C) sum = {A,B};
endmodule
### Testbench Code:
module tb;
reg A,B,C;
add adder(.A(A),.B(B),.C(C));
always
$display("A=%d",A);
$display("B=%d",B);
$display("C=%d",C);
$display("=========================");
endmodule
### Simulation Output:
![Lab4_1_1](https://i.imgur.com/1N4j3qE.jpg)
# Lab4_1_2
### Code:
add
module add(A,B,C);
output [8:0] sum;
input [8:0] A,B;
reg [8:0] C;
always@(negedge C) sum = {A,B};
endmodule
### Testbench Code:
module tb;
reg A,B,C;
add adder(.A(A),.B(B),.C(C));
always
$display("A=%d",A);
$display("B=%d",B);
$display("C=%d",C);
$display("=========================");
endmodule
### Simulation Output:
![Lab4_1_2](https://i.imgur.com/J6F6mQe.jpg)
# Lab4_1_3
### Code:
add
module add(A,B,C);
output [8:0] sum;
input [8:0] A,B;
reg [8:0] C;
always@(posedge A,B) sum = {A,B};
endmodule
### Testbench Code:
module tb;
reg A,B,C;
add adder(.A(A),.B(B),.C(C));
always
$display("A=%d",A);
$display("B=%d",B);
$display("C=%d",C);
$display("=========================");
endmodule
### Simulation Output:
![Lab4_1_3](https://i.imgur.com/8N69v1J.jpg)
# Lab4_1_4
### Code:
add
module add(A,B,C);
output [8:0] sum;
input [8:0] A,B;
reg [8:0] C;
always@(negedge A,negedge B) sum = {A,B};
endmodule
### Testbench Code:
module tb;
reg A,B,C;
add adder(.A(A),.B(B),.C(C));
always
$display("A=%d",A);
$display("B=%d",B);
$display("C=%d",C);
$display("=========================");
endmodule
### Simulation Output:
![Lab4_1_4](https://i.imgur.com/W6iLhYk.jpg)
/Lab4/Lab4_2.md
# Lab4_2_1
### Code:
mux
module mux(x,y,sel,z);
output z;
input x,y,sel;
always @*
case(sel)
	2'b00: z=x;
	2'b01: z=y;
	2'b10: z=x;
	2'b11: z=y;
endcase
endmodule
### Testbench Code:
module tb;
reg [1:0] x,y,sel;
wire z;
mux sel_mux(.x(x),.y(y),.sel(sel),.z(z));

always
$display("x=%d",x);
$display("y=%d",y);
$display("sel=%d",sel);
$display("z=%d",z);
$display("=========================");
endmodule
### Simulation Output:
![Lab4_2_1](https://i.imgur.com/f9X228k.jpg)
# Lab4_2_2
### Code:
mux
module mux(x,y,sel,z);
output z;
input x,y,sel;
always @*
case(sel)
	2'b00: z=x;
	2'b01: z=y;
	2'b10: z=x;
	2'b11: z=y;
endcase
endmodule
### Testbench Code:
module tb;
reg [1:0] x,y,sel;
wire z;
mux sel_mux(.x(x),.y(y),.sel(sel),.z(z));

always
$display("x=%d",x);
$display("y=%d",y);
$display("sel=%d",sel);
$display("z=%d",z);
$display("=========================");
endmodule
### Simulation Output:
![Lab4_2_2](https://i.imgur.com/yK0x0b6.jpg)
# Lab4_2_3
### Code:
mux
module mux(x,y,sel,z);
output z;
input x,y,sel;
always @*
case(sel)
	2'b00: z=x;
	2'b01: z=y;
	2'b10: z=x;
	2'b11: z=y;
endcase
endmodule
### Testbench Code:
module tb;
reg [1:0] x,y,sel;
wire z;
mux sel_mux(.x(x),.y(y),.sel(sel),.z(z));

always
$display("x=%d",x);
$display("y=%d",y);
$display("sel=%d",sel);
$display("z=%d",z);
$display("=========================");
endmodule
### Simulation Output:
![Lab4_2_3](https://i.imgur.com/e9hQ68L.jpg)
# Lab4_2_4
### Code:
mux
module mux(x,y,sel,z);
output z;
input x,y,sel;
always @*
case(sel)
	2'b00: z=x;
	2'b01: z=y;
	2'b10: z=x;
	2'b11: z=y;
endcase
endmodule
### Testbench Code:
module tb;
wire [1:0] x,y,sel;
wire z;
mux sel_mux(.x(x),.y(y),.sel(sel),.z(z));

always
$display("x=%d",x);
$display("y=%d",y);
$display("sel=%d",sel);
$display("z=%d",z);
$display("=========================");
endmodule
### Simulation Output:
![Lab4_2_4](https://i.imgur.com/34U33f9.jpg)
# Lab4_2_5
### Code:
mux
module mux(x,y,sel,z);
output z;
input x,y,sel;
always @*
case(sel)
	2'b00: z=x;
	2'b01: z=y;
	2'b10: z=x;
	2'b11: z=y;
endcase
endmodule
### Testbench Code:
module tb;
wire [1:0] x,y,sel;
wire z;
mux sel_mux(.x(x),.y(y),.sel(sel),.z(z));

always
$display("x=%d",x);
$display("y=%d",y);
$display("sel=%