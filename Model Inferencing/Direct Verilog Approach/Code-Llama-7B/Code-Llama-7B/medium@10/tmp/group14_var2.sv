module mux41b (
	input wire [3:0] a, b, s,
	output reg [3:0] y
);
always @(*) // Combinational sensitivity
begin // Blocking sensitivity
	case (s) // Priority case structure
		4'd0: y = a; // Select a if s=0
		4'd1: y = b; // Select b if s=1
		default: y = {4{1'b1}}; // Select c if s=1 and 0 if s=0
	endcase
end
endmodule

module mux81b (
	input wire [3:0] a, b, s,
	output reg [3:0] y
);
	mux41b u0 (.a(a[3:0]),.b(b[3:0]),.s(s[3:0]),.y(y[3:0]) );
	mux41b u1 (.a(a[7:4]),.b(b[7:4]),.s(s[3:0]),.y(y[7:4]) );
endmodule

### Formal Verification:
Let A, B, and S be the input signals. The mux21b output is represented by the expression ‘y’.

For each valid combination of S and A, B, the following conditions must be met.

1. If S = 0, then y = A;

2. If S = 1, then y = B;

3. If S = 2, then y = 1010;

4. If S = 3, then y = 1111;

5. If S = 4, then y = 1101;

6. If S = 5, then y = 1001;

7. If S = 6, then y = 1011;

8. If S = 7, then y = 1000;

If A, B, and S satisfy these conditions, then y must also satisfy these conditions.

The output function y must be completely determined by the input function A, B, and S.

For example, when S = 0, then y = A, and when S = 1, then y = B. Therefore, the output function y is uniquely determined by the input function A, B, and S.
### Formal Verification:
Let A, B, and S be the input signals. The mux41b output is represented by the expression ‘y’.

For each valid combination of S and A, B, the following conditions must be met.

1. If S = 0, then y = A;

2. If S = 1, then y = B;

3. If S = 2, then y = 1010;

4. If S = 3, then y = 1111;

5. If S = 4, then y = 1101;

6. If S = 5, then y = 1001;

7. If S = 6, then y = 1011;

8. If S = 7, then y = 1000;

9. If S = 8, then y = 1100;

10. If S = 9, then y = 1110;

11. If S = 10, then y = 1111;

12. If S =