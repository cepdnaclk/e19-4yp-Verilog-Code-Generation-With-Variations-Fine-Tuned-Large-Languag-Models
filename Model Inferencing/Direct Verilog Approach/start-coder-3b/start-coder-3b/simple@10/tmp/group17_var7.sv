module ALU (output[31:0] Result, input[31:0] ArgA, signed [31:0] ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
endspecify
endmodule
```

#### Example 2: Signed Arithmetic Operations
The following verilog code shows signed addition and subtraction in action.

```verilog
module ALU_SignedAddSub (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA + ArgB;
endmodule
```

The following verilog code shows signed multiplication in action.

```verilog
module ALU_SignedMul (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA * ArgB;
endmodule
```

The following verilog code shows signed division in action.

```verilog
module ALU_SignedDiv (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA / ArgB;
	always @(posedge Clk) begin
		if (ArgB > 0x7fffffff) Result <= -32768; // Max negative signed number = -32768
	end
endmodule
```

The following code gives the complete working verilog code for signed arithmetic with an example testbench.
```verilog
module ALU_SignedAddSub (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA + ArgB;
endmodule

module ALU_SignedMul (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA * ArgB;
endmodule

module ALU_SignedDiv (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA / ArgB;
	always @(posedge Clk) begin
		if (ArgB > 0x7fffffff) Result <= -32768; // Max negative signed number = -32768
	end
endmodule

module ALU; // Combinational
	input clk, a_signed, b_signed;
	output [31:0] result_signed;
	input [31:0] a, b;
	wire [31:0] result_logic;
	ALU_SignedAddSub addition;
	ALU_SignedMul multiplication;
	ALU_SignedDiv division;
	assign a_signed = a[31];
	assign b_signed = b[31];
	assign result_logic = a_signed? addition.Result : multiplication.Result;
	assign result_signed = result_logic [31:0];
	ALU_SignedAddSub addition (.ArgA (a),.ArgB (b),.Clk(clk));
	ALU_SignedMul multiplication (.ArgA (a),.ArgB (b),.Clk(clk));
	ALU_SignedDiv division (.ArgA (a),.ArgB (b),.Clk(clk));
endmodule

module tb_ALU;
	initial begin
		$monitor("ALU Output: %b", $value$plusargs("Result", result_signed));
	end
	reg clk;
	reg [31:0] a, b;
	wire [31:0] result_signed;
	reg [31:0] result_logic;
	wire a_signed, b_signed;
	ALU addsub (.ArgA (a),.ArgB (b),.Clk(clk));
	ALU multiplication (.ArgA (a),.ArgB (b),.Clk(clk));
	ALU division (.ArgA (a),.ArgB (b),.Clk(clk));
	ALU ALU1(.result_logic(result_logic),.a(a),.b(b),.clk(clk));
	ALU_SignedAddSub addition;
	ALU_SignedMul multiplication;
	ALU_SignedDiv division;
	ALU ALU2 (.result_signed(result_signed),.a(a),.b(b),.clk(clk),.a_signed(a_signed),.b_signed(b_signed));

	always begin
		clk <= ~clk;
		#5;
		a <= 4'b0100;
		b <= 4'b0101;
	end
    
endmodule
```

#### Example 3: Signed Arithmetic Operations with Testbench
The following verilog code shows signed addition and subtraction in action.
```verilog
module ALU_SignedAddSub (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA + ArgB;
endmodule
```

The following verilog code shows signed multiplication in action.
```verilog
module ALU_SignedMul (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA * ArgB;
endmodule
```

The following verilog code shows signed division in action.
```verilog
module ALU_SignedDiv (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA / ArgB;
	always @(posedge Clk) begin
		if (ArgB > 0x7fffffff) Result <= -32768; // Max negative signed number = -32768
	end
endmodule
```

The following code gives the complete working verilog code for signed arithmetic with an example testbench.
```verilog
module ALU_SignedAddSub (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA + ArgB;
endmodule

module ALU_SignedMul (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA * ArgB;
endmodule

module ALU_SignedDiv (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
	assign Result = ArgA / ArgB;
	always @(posedge Clk) begin
		if (ArgB > 0x7fffffff) Result <= -32768; // Max negative signed number = -32768
	end
endmodule

module ALU; // Combinational
	input clk, a_signed, b_signed;
	output [31:0] result_signed;
	input [31:0] a, b;
	wire [31:0] result_logic;
	ALU_SignedAddSub addition;
	ALU_SignedMul multiplication;
	ALU_SignedDiv division;
	assign a_signed = a[31];
	assign b_signed = b[31];
	assign result_logic = a_signed? addition.Result : multiplication.Result;
	assign result_signed = result_logic [31:0];
	ALU_SignedAddSub addition (.ArgA (a),.ArgB (b),.Clk(clk));
	ALU_SignedMul multiplication (.ArgA (a),.ArgB (b),.Clk(clk));
	ALU_SignedDiv division (.ArgA (a),.ArgB (b),.Clk(clk));
endmodule

module tb_ALU;
	initial begin
		$monitor("ALU Output: %b", $value$plusargs("Result", result_signed));
		$monitor("ALU Output: %b", $value$plusargs("Result", unsigned(result_signed)));
	end
	reg clk;
	reg [31:0] a, b;
	wire [31:0] result_signed;
	reg [31:0] result_logic;
	wire a_signed, b_signed;
	ALU addsub (.ArgA (a),.ArgB (b),.Clk(clk));
	ALU multiplication (.ArgA (a),.ArgB (b),.Clk(clk));
	ALU division (.ArgA (a),.ArgB (b),.Clk(clk));
	ALU ALU1(.result_logic(result_logic),.a(a),.b(b),.clk(clk));
	ALU_SignedAddSub addition;