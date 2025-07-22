module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
// 	wire [3:0] Excess_3_out;

generate
	for(HiCnt = 0; HiCnt <= 7; HiCnt = HiCnt + 1) begin
		assign Excess_3_out[HiCnt] = BCD_in[HiCnt];
	end
endgenerate
assign Excess_3_out[8] = 3;
endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);

initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
end
initial begin //Simulation Test Pattern

initial begin
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

If you want to make it run in simulation, you should add test bench and make the initialization of BCD_in in the test bench.

If you want to make it run in Quartus, you should add test bench and make the initialization of BCD_in in the test bench.

### Question:
If you want to make it run in simulation, you should add test bench and make the initialization of BCD_in in the test bench.
If you want to make it run in Quartus, you should add test bench and make the initialization of BCD_in in the test bench.
### Your Answer:
It looks like when you want to make it run in simulation, you should add test bench and make the initialization in the test bench.

If you want to make it run in Quartus, you should add test bench and make the initialization of BCD_in in the test bench.

### Question:
What is the difference between code and code block?
What is the difference between code and code block?

### Your Answer:
Code block, is a sequence of code to be executed by the simulator.

Block is the set of code contained in the same scope.

### Question:
Why is the scope of a task/function/module different from a block?
Why is the scope of a task/function/module different from a block?

### Your Answer:

If you want to make it run in simulation, you should add test bench and make the initialization of BCD_in in the test bench.

If you want to make it run in simulation, you should add test bench and make the initialization of BCD_in in the test bench.

If you want to make it run in simulation, you should add test bench and make the initialization in the test bench.

If you want to make it run in simulation, you should add test bench and make the initialization of BCD_in in the test bench.

If you want to make it run in Quartus, you should add test bench and make the initialization of BCD_in in the test bench.

### Question:
What is the difference between code and code block?
Code block, is a sequence of code to be executed by the simulator.

Block is the set of code contained in the same scope.

### Your Answer:
Code block, is a sequence of code to be executed by the simulator.

Block is the set of code contained in the same scope.

### Question:
The following code compiles fine, but the compiler is not happy about the generate block.

module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;

assign Excess_3_out[8] = 3;

endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;

encoder M0(BCD_in, Excess_3_out);

initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);
initial begin
end
initial begin //Simulation Test Pattern
end
endmodule

module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;

assign Excess_3_out[8] = 3;

endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;

encoder M0(BCD_in, Excess_3_out);

initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);
initial begin
end
initial begin end

initial begin end

initial begin end
### Question:
The following code compiles fine, but the compiler is not happy about the generate block.

module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;

assign Excess_3_out[8] = 3;

endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;

encoder M0(BCD_in, Excess_3_out);

initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);
initial begin
end
initial begin end

initial begin end

initial begin end
### Your Answer:
The assignment and the generate code are different.

In the `generate` block, as a sequence of code to be executed, the `assign` statements are executed during simulation.

However, in the `initial` block, as a sequence of initializing code, the `assign` statements are executed during synthesis.

### Question:
What is the difference between code and code block?
The assignment and the generate code are different.

In the generate block, as a sequence of code to be executed, the assign statements are executed during simulation.

### Your Answer:
In the `generate` block, as a sequence of code to be executed, the `assign` statements are executed during simulation.

However, in the `initial` block, as a sequence of initializing code, the `assign` statements are executed during synthesis.

### Question:
Why is the scope of a task/function/module different from a block?
Why is the scope of a task/function/module different from a block?

### Your Answer:

In the `generate` block, as a sequence of code to be executed, the `assign` statements are executed during simulation.

However, in the `initial` block, as a sequence of initializing code, the `assign` statements are executed during synthesis.

### Question:
The following code compiles fine, but the compiler is not happy about the generate block.

module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;

assign Excess_3_out[8] = 3;

endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;

encoder M0(BCD_in, Excess_3_out);

initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);
initial begin
end
initial begin end

initial begin end

initial begin end
### Variable Scope
What is the difference between code and code block?
The assignment and the generate code are different.

In the generate block, as a sequence of code to be executed, the assign statements are executed during simulation.

In the generate block, as a sequence of code to be executed, the assign statements are executed during simulation.