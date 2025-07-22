module tst_dffbehen; // test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiation of the D latch
initial
begin
 en=0; // Latch initially disabled (opaque)
 di=1'b0; // Initial data
end
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation
endmodule
## Question 1 (20):
- Generate all possible combinations of 2 input vectors and compare them in a single line.
## Question 2 (20):
- For an input of 16 bits, generate all possible combinations of the input and the output of the following block:
	- module comparator_onehot(in,y);
		- reg [15:0] in;
		- output reg [1:0] y;
## Question 3 (20):
- Generate all possible combinations of 2 input vectors. In each combination, compare the input vectors of the following block:
	- module comparator_onehot(in,y);
		- reg [15:0] in;
		- output reg [1:0] y;
	- output [1:0] y;
## Question 4 (20):
- In the following block, modify the following code to include a reset block that resets both the input and the output vectors if `rst` is `1`:
	- module comparator_onehot(in,y);
		- reg [15:0] in;
		- output reg [1:0] y;
	- input y_p;
	- output y_n;
	- genvar i;
	- generate
	- if (i<16) begin
		- assign y_p=y[i];
		- assign y_n=~y[i];
	- end
	- else begin
		- assign y_p=1'b0;
		- assign y_n=1'b1;
	- end
	- endgenerate
## Question 5 (20):
- Modify the following code to include a reset block that resets both the input and the output vectors if `rst` is `1`:
	- module comparator_onehot(in,y);
		- reg [15:0] in;
		- output reg [1:0] y;
	- input y_p;
	- output y_n;
	- genvar i;
	- generate
	- if (i<16) begin
		- assign y_p=y[i];
		- assign y_n=~y[i];
	- end
	- else begin
		- assign y_p=1'b0;
		- assign y_n=1'b1;
	- end
	- endgenerate
- Create a test bench for the previous module:
	- module comparator_onehot_tb;
		- reg in, rst;
		- reg [15:0] y;
		- reg y_p, y_n;
		- wire [16:0] onehot;
		- comparator_onehot comp(onehot,y,in);
		- initial begin
			in=0;
			$monitor(onehot,y,in);
		end
		- always #10 rst=1;
		- initial begin
			in=281;
			$monitor(onehot,y,in);
		end
		- always #10 rst=0;
		- initial begin
			in=281;
			$monitor(onehot,y,in);
		end
		- always #10 rst=0;
		- always #10 in=in+1;
		- initial $finish;
	- endmodule
- Run the `comparator_onehot_tb` and check the output of the comparator's register `onehot`. Make sure this register is reseted when `rst` is `1`.
## Question 6 (20):
- Modify the previous module to include a reset block that resets the input vector if `rst` is `1`, and resets the output vector to `0` if the previous vector has a one-hot encoding.
## Question 7 (20):
- Modify the previous module to include a reset block that resets the input vector if `rst` is `1`, and resets the output vector to `0` if the previous vector has a one-hot encoding.
- Create a test bench for the previous module:
	- module comparator_onehot_tb;
		- reg in, rst;
		- reg [15:0] y;
		- reg y_p, y_n;
		- wire [16:0] onehot;
		- comparator_onehot comp(onehot,y,in);
		- initial begin
			in=0;
			$monitor(onehot,y,in);
		end
		- always #10 rst=1;
		- initial begin
			in=281;
			$monitor(onehot,y,in);
		end
		- always #10 rst=0;
		- initial begin
			in=281;
			$monitor(onehot,y,in);
		end
		- always #10 rst=0;
		- always #10 in=in+1;
		- initial $finish;
	- endmodule
- Run the `comparator_onehot_tb` and check the output of the comparator's register `onehot`. Make sure this register is reseted when `rst` is `1`.
## Question 8 (20):
- For a 16-bit input vector with one-hot encoding, generate all possible combinations of the input and the output of the following block:
	- module comparator_onehot(in,y);
		- reg [15:0] in;
		- output reg [1:0] y;
	- input y_p;
	- output y_n;
	- genvar i;
	- generate
	- if (i<16) begin
		- assign y_p=y[i];
		- assign y_n=~y[i];
	- end
	- else begin
		- assign y_p=1'b0;
		- assign y_n=1'b1;
	- end
	- endgenerate
- Create a test bench for the previous module:
	- module comparator_onehot_tb;
		- reg in, rst;
		- reg [15:0] y;
		- reg y_p, y_n;
		- wire [16:0] onehot;
		- comparator_onehot comp(onehot,y,in);
		- initial begin
			in=0;
			$monitor(onehot,y,in);
		end
		- always #10 rst=1;
		- initial begin
			in=281;
			$monitor(onehot,y,in);
		end
		- always #10 rst=0;
		- initial begin
			in=281;
			$monitor(onehot,y,in);
		end
		- always #10 rst=0;
		- always #10 in=in+1;
		- initial $finish;
	- endmodule
- Run the `comparator_onehot_tb` and check the output of the comparator's register `onehot`. Make sure this register is reseted when `rst` is `1`.
## Question 9 (20):
- For an input of 16 bits, generate all possible combinations of the input and the output of the following block:
	- module comparator_onehot(in,y);
		- reg [15:0] in;
		- output reg [1:0] y;
	- input y_p;
	- output y_n;
	- genvar i;
	- generate
	- if (i<16) begin
		- assign y_p=y[i];
		- assign y_n=~y[i];
	- end
	- else begin
		- assign y_p=1'b0;
		- assign y_n=1'b1;
	- end
	- endgenerate
- Create a test bench for the previous module:
	- module comparator_onehot_tb;
		- reg in, rst;
		- reg [15:0] y;
		- reg y_p, y_n;
		- wire [16:0] onehot;
		- comparator_onehot comp(onehot,y,in);
		- initial begin
			in=0;