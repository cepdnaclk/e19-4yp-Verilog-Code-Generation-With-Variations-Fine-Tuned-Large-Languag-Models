module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(posedge Clock)
    if (Sel == 1)
        Q <= D1;
    else if (Sel == 0)
        Q <= D0;
    else
        Q <= zero;
endmodule
### Results:
| 0x0 | 01 | 01 | 10 | 10 | 00 | 00 | 01 |
|-----|----|----|----|----|----|----|----|
| 16  | 4  | 4  | 8  | 8  | 0  | 0  | 4  |

Even though the code is the same, the results are different. This is because the if/else statement is synthesizable, while the if statement is not.
, 0);
	else
		A <= 1;
	if (A == 1)
		B <= 0;
	else
		B <= 1;
	if (sel == 3)
		C <= 1;
	else
		C <= 0;
	if (sel == 3)
		D <= 1;
	else
		D <= 0;
endmodule

module srl(D0, D1, D2, D3, Q, sel);
input D0, D1, D2, D3, sel;
output Q;
always @(posedge sel)
	if (sel == 2)
		Q <= D1;
	else if (sel == 1)
		Q <= D2;
	else if (sel == 0)
		Q <= D3;
	else
		Q <= zero;
endmodule

module sra(A, B, sel, Q);
input A, B;
output Q;
always @(posedge sel)
	if (sel == 1)
		Q <= A;
	else if (sel == 2)
		Q <= B;
	else
		Q <= zero;
endmodule

module sll(A, B, sel, Q);
input A, B;
output Q;
always @(posedge sel)
	if (sel == 1)
		Q <= A;
	else if (sel == 2)
		Q <= B;
	else
		Q <= zero;
endmodule
```

## Question 5
### Q5:

```
module mstest(d0, d1, d2, d3, d4, s, r, o, sel, clk, rst);
input d0, d1, d2, d3, d4, s, r, o, sel;
output clk, rst;

reg d0, d1, d2, d3, d4;
reg s, r, o;
reg clk, rst;

always @( posedge clk )
	rst <= r;
always @( posedge clk or posedge rst )
	d0 <= d1;
	d1 <= d2;
	d2 <= d3;
	d3 <= d4;

always @( posedge clk )
	o <= s;

always @( posedge clk or posedge rst )
	s <= s1;
	r <= r1;
always @( posedge clk )
	d4 <= d0 ^ d1 ^ d2 ^ d3;
always @( posedge clk )
	s1 <= d0 ^ d1 ^ d2 ^ d3;
always @( posedge clk )
	r1 <= d0 & d1 & d2 & d3;

	endmodule
```

## Question 6
### Q6:

```
module test_addsub(a1, a2, b1, b2, d, r, sel, clk);
input a1, a2, b1, b2, r, d;
output s, sel, clk;
reg a1, a2, b1, b2, d, r, sel, clk;

module add(a1, a2, r, s);
input a1, a2;
output r, s;
s <= a1 ^ a2;
r <= a1 & a2;
endmodule

module sub(a1, a2, r, s);
input a1, a2;
output r, s;
s <= a1 & ~a2;
r <= ~a1 & a2;
endmodule

module add_sub(a1, a2, b1, b2, d, r, s);
input a1, a2, b1, b2, r, d;
output s, clk;

always @( posedge clk )
	s <= 	d?	sub(a1, a2, r, s) : add(a1, a2, r, s);

endmodule

module srl(A, B, Q);
input A, B;
output Q;

always @(*)
	Q <= A;
endmodule

module sll(A, B, Q);
input A, B;
output Q;

always @(*)
	Q <= B;
endmodule

module mux2(A, S, Q);
input A, S;
output Q;

always @(*)
	Q <= A;
endmodule

module mux(A, B, C, D, sel, Q);
input A, B, C, D, sel;
output Q;

always @(*)
	case (sel)
		0 : Q <= A;
		1 : Q <= B;
		2 : Q <= C;
		3 : Q <= D;
	endcase
endmodule
module mux_sl(A, B, sel, Q);
input A, B;
input sel;
output Q;

always @(*)
	case (sel)
		0 : Q <= A;
		1 : Q <= B;
	endcase
endmodule
module mux(A, B, C, sel, Q);
input A, B, C;
input sel;
output Q;

always @(*)
	case (sel)
		0 : Q <= A;
		1 : Q <= B;
		2 : Q <= C;
	endcase
endmodule

module mux_andor(A