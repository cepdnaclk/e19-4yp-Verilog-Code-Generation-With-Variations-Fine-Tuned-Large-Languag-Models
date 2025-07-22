module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
case (count)
4'b0000: count <= 4'b0001;
4'b0001: count <= 4'b0011;
4'b0011: count <= 4'b0111;
4'b0111: count <= 4'b1111;
4'b1111: count <= 4'b1110;
4'b1110: count <= 4'b1100;
4'b1100: count <= 4'b1000;
4'b1000: count <= 4'b0000;
default: count <= 0;
endcase
endmodule

module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
join
endmodule

Question 3:

(a) What is the purpose of the module `Johnson_Counter` and `t_Johnson_Counter`?
(b) What is the difference between the Verilog code and the test bench code
(c) What are the test cases used in this test bench?

#### Answer:

(a) the Johnson counter module generates a counter count with the following rule: 0 -> 1 -> 11 -> 111 -> 1111 -> 1110 -> 1100 -> 1000 -> 0 (reset to 0). In the test bench, the module is called through input signals `enable` and `clock`. The test bench will generate a clock signal `clock` and reset signal `reset`. `enable` is the input signal to the module. The reset signal is the input signal to the reset block of the module. The reset signal `reset` is used to reset the counter count to 0.
(b) the Verilog code is the Verilog code of the Johnson counter module. The test bench code uses the verilog code and generate the test modules.
(c) the test cases used for the test bench is the following:

enable | clock | count
---------|-------|--------
x | 0| 0
0 | 0| 0
0 | 1| 1
1 | 0| 1
1 | 1| 1

## Question 4:

Consider the Verilog code from question 2.

(a) Describe the behavioural behaviour of the module Johnson Counter.
(b) What is the output count when the input enable and clock are 0 and 1 respectively?
(c) What is the output count when the input enable and clock are 1 and 0 respectively?

#### Answer:

(a) The Verilog code is the Verilog code of the Johnson counter module. In this code, count is declared with bit width 4. The register count is the output `count`. The input of the module is `clock`, `reset` and `enable`. The register count is controlled by the enable signal and reset signal. The logic inside the register is the following:

### Base Verilog Code:
module Johnson_Counter_base (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
case (count)
4'b0000,
4'b0001,
4'b0011,
4'b0111: count <= {count[2: 0], 1'b1};
4'b1111,
4'b1110,
4'b1100,
4'b1000: count <= {count[2: 0], 1'b0};
default: count <= 0;
endcase
endmodule

module t_Johnson_Counter_base ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter_base M0 (count, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
join
endmodule

Question 4(a):

(a) Describe the behavioural behaviour of the module Johnson Counter.

#### Answer:

(a) The Johnson counter module generates a counter count with the following rule: 0 -> 1 -> 11 -> 111 -> 1111 -> 1110 -> 1100 -> 1000 -> 0 (reset to 0). In the test bench, the module is called through input signals `enable` and `clock`. The test bench will generate a clock signal `clock` and reset signal `reset`. `enable` is the input signal to the module. The reset signal is the input signal to the reset block of the module. The reset signal `reset` is used to reset the counter count to 0.

(b) What is the output count when the input enable and clock are 0 and 1 respectively?

#### Answer:

(b)

enable | clock | count
---------|-------|--------
x | 0| 0
0 | 0| 0
0 | 1| 1

(c) What is the output count when the input enable and clock are 1 and 0 respectively?

#### Answer:

(c)

enable | clock | count
---------|-------|--------
x | 0| 0
1 | 0| 1
1 | 1| 1

## Question 5:

Consider the Verilog code from question 3.

(a) Describe the behavioural behaviour of the module Johnson Counter when enable is 1 and clock is 1
(b) Describe the behavioural behaviour of the module Johnson Counter when enable is 0 and clock is 1
(c) Describe the behavioural behaviour of the module Johnson Counter when enable is 1 and clock is 0
(d) Describe the behavioural behaviour of the module Johnson Counter when enable is 0 and clock is 0

#### Answer:

(a) Describe the behavioural behaviour of the module Johnson Counter when enable is 1 and clock is 1

#### Answer:

(a) When enable is 1 and clock is 1, count will change from 0 to 1 with the following rule: 0 -> 1 -> 11 -> 111 -> 1111 -> 1110 -> 1100 -> 1000 -> 0 (reset to 0).

(b) Describe the behavioural behaviour of the module Johnson Counter when enable is 0 and clock is 1

#### Answer:

(b) When enable is 0 and clock is 1, the count will not be changed. The count will maintain its value.

(c) Describe the behavioural behaviour of the module Johnson Counter when enable is 1 and clock is 0

#### Answer:

(c) When enable is 1 and clock is 0, the count will change from 0 to 1 with the following rule: 0 -> 1 -> 11 -> 111 -> 1111 -> 1110 -> 1100 -> 1000 -> 0 (reset to 0).

(d) Describe the behavioural behaviour of the module Johnson Counter when enable is 0 and clock is 0

#### Answer:

(d) When enable is 0 and clock is 0, the count will not be changed. The count will maintain its value.

## Question 6:

Consider the Verilog code from question 2.

(a) Describe the behavioural behaviour of the module Johnson Counter when enable is 0 and clock is 0
(b) Describe the behavioural behaviour of the module Johnson Counter when enable is 1 and clock is 0
(c) Describe the behavioural behaviour of the module Johnson Counter when enable is 0 and clock is 1

#### Answer:

(a) Describe the behavioural behaviour of the module Johnson Counter when enable is 0 and clock is 0

#### Answer:

(a) When enable is 0 and clock is 0, the count will not be