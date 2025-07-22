module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Execution Result:
Input:
x1 = 1'b1, x2 = 1'b1, x3 = 1'b1
Output:
f = -1
Input:
x1 = 1'b1, x2 = 1'b1, x3 = 1'b0
Output:
f = 3
Input:
x1 = 1'b0, x2 = 1'b0, x3 = 1'b1
Output:
f = 3
Input:
x1 = 1'b0, x2 = 1'b0, x3 = 1'b0
Output:
f = 3
Lab 09:

A.	Why does this test fail? Describe how you verified that this test fails.
	Input:
		A = {1, 0, 0}
		B = {0, 1, 0}
		C = {0, 0, 1}
		D = {1, 1, 1}
	Output:
		S = {0, 1, 1}
		S = {1, 0, 1}
		S = {1, 1, 0}
		S = {1, 1, 0}
	Expected Output:
		S = {1, 0, 1}
	Why does this test fail?
	Because A and D have the same output.
	To verify this test fails:
		Check the output for each input for the correct output.
		Check the output for each input for the correct output.

B.	How is this test implemented in Verilog? Which output is being tested?
	This test is implemented in Verilog by checking each output for each input and checking if the output is the correct output.
	Output:
		S = {1, 1, 1}
		S = {1, 0, 1}
		S = {1, 1, 0}
		S = {1, 1, 0}

C.	Using a truth table, write down the boolean expression for this circuit.
	S[0] = A[0] XOR A[1] XOR A[2] XOR B[0] XOR B[1] XOR B[2] XOR C[0] XOR C[1] XOR C[2]
	S[1] = A[0] XOR A[1] XOR A[2] XOR B[0] XOR B[1] XOR B[2] XOR C[0] XOR C[1] XOR C[2]
	S[2] = A[0] XOR A[1] XOR A[2] XOR B[0] XOR B[1] XOR B[2] XOR C[0] XOR C[1] XOR C[2]

D.	Given a 2-bit adder and a 3-bit adder, construct a circuit that addes 2-bit vectors and 3-bit vectors.
	Circuit 1:
		module adder2(a, b, sum, cout);
		input a, b, sum;
		output cout;
		reg cin;
		assign sum = (a[0] == b[0])? cin : a[0] + b[0];
		assign cout = (a[0] == b[0])? cin : 1'b0;
		always @(a, b, sum, cin) begin
			cin <= cout;
		end
	endmodule
	Circuit 2:
		module adder3(a, b, sum, cout);
		input a, b, sum;
		output cout;
		wire [1:0] sum_2bit;
		reg cin;
		adder2 adder2_0(a[1:0], b[1:0], sum_2bit, cin);
		assign sum[1:0] = sum_2bit;
		assign sum[2] = a[2] + b[2];
		assign cout = cin;
		endmodule
	Test File:
		module adder3_testbench;
		reg [1:0] a;
		reg [1:0] b;
		wire [2:0] sum;
		wire cin;
		adder3 adder3(a, b, sum, cin);
		initial begin
			$display("Input: a = %d, b = %d", a, b);
			$display("Output: sum = %d, cin = %d", sum, cin);
			$display("Expected Output:");
			$display("		sum = %d", sum);
			$display("		cin = %d", cin);
		end
		initial begin
			a = 2'b10;
			b = 2'b10;
		end
		initial begin
			a = 2'b01;
			b = 2'b10;
		end
		initial begin
			a = 2'b10;
			b = 2'b01;
		end
		initial begin
			a = 2'b10;
			b = 2'b10;
		end
		initial begin
			a = 2'b11;
			b = 2'b11;
		end
		initial begin
			a = 2'b01;
			b = 2'b11;
		end
		initial begin
			a = 2'b11;
			b = 2'b01;
		end
		initial begin
			a = 2'b01;
			b = 2'b01;
		end
		initial begin
			a = 2'b11;
			b = 2'b00;
		end
		initial begin
			a = 2'b01;
			b = 2'b00;
		end
		initial begin
			a = 2'b11;
			b = 2'b10;
		end
		initial begin
			a = 2'b01;
			b = 2'b10;
		end
		initial begin
			a = 2'b11;
			b = 2'b11;
		end
		initial begin
			a = 2'b00;
			b = 2'b11;
		end
		initial begin
			a = 2'b10;
			b = 2'b11;
		end
		initial begin
			a = 2'b00;
			b = 2'b01;
		end
		initial begin
			a = 2'b00;
			b = 2'b10;
		end
		initial begin
			a = 2'b11;
			b = 2'b00;
		end
		initial begin
			a = 2'b01;
			b = 2'b00;
		end
		initial begin
			a = 2'b10;
			b = 2'b00;
		end
		initial begin
			a = 2'b00;
			b = 2'b00;
		end
		initial begin
			a = 2'b00;
			b = 2'b11;
		end
		initial begin
			a = 2'b10;
			b = 2'b00;
		end
		initial begin
			a = 2'b00;
			b = 2'b01;
		end
		initial begin
			a = 2'b01;
			b = 2'b11;
		end
		initial begin
			a = 2'b11;
			b = 2'b10;
		end
		initial begin
			a = 2'b10;
			b = 2'b11;
		end
		initial begin
			a = 2'b01;
			b = 2'b01;
		end
		initial begin
			a = 2'b11;
			b = 2'b11;
		end
		initial begin
			a = 2'b01;
			b = 2'b11;
		end
		initial begin
			a = 2'b11;
			b