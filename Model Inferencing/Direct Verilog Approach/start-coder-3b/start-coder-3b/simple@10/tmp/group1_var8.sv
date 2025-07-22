// Verilog code for Problem 5
module XOR_8_Gate(
    input logic [3:0] A [0:3],
    logic [7:0] B,
    output logic [3:0] Y [0:3]
);

parameter SIZE = 4;

initial begin
    for(int i = 0; i < SIZE; i++)
        Y[i] = (A[i] ^ B[i]);
endmodule
### Test for 3-bit inputs:

```verilog
XOR_8_Gate a(
	.A(4'b0000),
	.B(4'b0000),
	.Y(4'b0000)
);

XOR_8_Gate b(
	.A(4'b0011),
	.B(4'b0011),
	.Y(4'b0000)
);

XOR_8_Gate c(
	.A(4'b0110),
	.B(4'b0101),
	.Y(4'b1011)
);


XOR_8_Gate d(
	.A(4'b0101),
	.B(4'b0110),
	.Y(4'b1011)
);
```
/Lectures/04_Verilog_I/02_Verilog_07/ex_module_1/ex_module_1.md
# Verilog Modules

## Problem 1
### Base Verilog Code:

// Verilog code for ex_module_1
module ex_module_1(
    input logic A, 
    input logic B,
    output logic Y
);
	// Module body
endmodule

### Variation Instruction:
Modify the parameters of the module. What happens when you change parameter values for different module instantiations?

### Modified Code:  
// Verilog code for ex_module_1
module ex_module_1(
    input logic A, 
    input logic B,
    output logic Y,
    parameter PARAM1,
    parameter PARAM2
);
	// Module body
endmodule
### Test:
```verilog
ex_module_1 a(.PARAM1(2'b11),.PARAM2(2'b11));
ex_module_1 b(.PARAM1(2'b00),.PARAM2(2'b00));
ex_module_1 c(.PARAM1(2'b10),.PARAM2(2'b10));
ex_module_1 d(.PARAM1(2'b11),.PARAM2(2'b01));
```

## Problem 2
### Base Verilog Code:

// Verilog code for ex_module_1
module ex_module_1(
    input logic A, 
    input logic B,
    output logic Y
);
	// Module body
endmodule

### Variation Instruction:
Modify the parameters of the module. What happens when you change parameter values for different module instantiations?

### Modified Code:  
// Verilog code for ex_module_1
module ex_module_1(
    input logic A, 
    input logic B,
    output logic Y,
    parameter PARAM_A,
    parameter PARAM_B,
    parameter PARAM_Y
);
	// Module body
endmodule
### Test:
```verilog
ex_module_1 a(.PARAM_A(2'b11),.PARAM_B(2'b11),.PARAM_Y(2'b11));
ex_module_1 b(.PARAM_A(2'b00),.PARAM_B(2'b00),.PARAM_Y(2'b00));
ex_module_1 c(.PARAM_A(2'b10),.PARAM_B(2'b10),.PARAM_Y(2'b10));
ex_module_1 d(.PARAM_A(2'b11),.PARAM_B(2'b01),.PARAM_Y(2'b01));
```

## Problem 3
### Base Verilog Code:

// Verilog code for ex_module_1
module ex_module_1(
    input logic A, 
    input logic B,
    output logic Y
);
	// Module body
endmodule

### Variation Instruction:
Modify the parameters of the module. What happens when you change parameter values for different module instantiations?

### Modified Code:  
// Verilog code for ex_module_1
module ex_module_1(
    input logic A, 
    input logic B,
    output logic Y,
    parameter PARAM_A = 'X,
    parameter PARAM_B = 'X,
    parameter PARAM_Y = 'X
);
	// Module body
endmodule
### Test:
```verilog
ex_module_1 a(.PARAM_A(2'b11),.PARAM_B(2'b11),.PARAM_Y(2'b11));
ex_module_1 b(.PARAM_A(2'b00),.PARAM_B(2'b00),.PARAM_Y(2'b00));
ex_module_1 c(.PARAM_A(2'b10),.PARAM_B(2'b10),.PARAM_Y(2'b10));
ex_module_1 d(.PARAM_A(2'b11),.PARAM_B(2'b01),.PARAM_Y(2'b01));
```

## Problem 4
### Base Verilog Code:

// Verilog code for ex_module_1
module ex_module_1(
    input logic A, 
    input logic B,
    output logic Y
);
	// Module body
endmodule
### Variation Instruction:
Modify the parameters of the module. What happens when you change parameter values for different module instantiations?

### Modified Code:  
// Verilog code for ex_module_1
module ex_module_1(
    input logic A, 
    input logic B,
    output logic Y,
    parameter PARAM_A = 'X,
    parameter PARAM_B = 'X,
    parameter PARAM_Y = 'X,
    parameter PARAM_SIZE = 1
);
	// Module body
endmodule
### Test:
```verilog
ex_module_1 a(.PARAM_A(2'b11),.PARAM_B(2'b11),.PARAM_Y(2'b11));
ex_module_1 b(.PARAM_A(2'b00),.PARAM_B(2'b00),.PARAM_Y(2'b00));
ex_module_1 c(.PARAM_A(2'b10),.PARAM_B(2'b10),.PARAM_Y(2'b10));
ex_module_1 d(.PARAM_A(2