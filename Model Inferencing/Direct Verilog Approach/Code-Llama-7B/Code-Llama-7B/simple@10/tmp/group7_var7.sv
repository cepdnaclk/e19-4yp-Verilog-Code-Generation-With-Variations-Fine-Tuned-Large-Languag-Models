```
module AndOr (output X, Y, input [0:0] A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
```

## Code Preparation Steps

### Step 1: Create a Project

1. Create an empty project or copy the project from *Project - Create New Project...*.
2. Copy the code from *Base Verilog Code* to *Variation Instruction* to *Modified Code*.

### Step 2: Compile the Verilog Code

1. Right click the project and click *Compile*.
2. Check the *Compile* window for compilation errors.

### Step 3: Run the Design

1. Create test bench module as shown below.
2. Right click the test bench module and click *Run*.

```
module TestBench();
AndOr #1 UUT (.A(1'b1),.B(1'b0),.C(1'b1),.X(),.Y());
initial
	#10 $finish;
endmodule
```

### Step 4: Simulation Results

1. Check the simlution results in the *Waveform* window.

### Step 5: Examine the Modifications

* Open the *