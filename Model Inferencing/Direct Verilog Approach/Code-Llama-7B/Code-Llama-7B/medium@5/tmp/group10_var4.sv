module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
wire [3:0] wires [0: 3];
reg [1:0] sel [0: 3];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= wires[sel[0]][sel[1]];
endmodule
```

<a name="3.3.6.4"></a>

### 3.3.6.4

Write a Verilog module to produce a 4-bit register that responds to the following inputs:

```
D = 4'b0110
Clock = 1
Resetn = 0
W_en = 1
Q_sel = 2'b00

Output:
Q[0] = 0
Q[1] = 1
Q[2] = 1
Q[3] = 0
```

<a name="3.3.6.5"></a>

### 3.3.6.5

Write a Verilog module to produce a 4-bit register that responds to the following inputs:

```
D = 4'b0110
Clock = 1
Resetn = 0
W_en = 1
Q_sel = 2'b00

Output:
Q[0] = 0
Q[1] = 1
Q[2] = 1
Q[3] = 0
```

<a name="3.3.6.6"></a>

### 3.3.6.6

Write a Verilog module to produce a 4-bit register that responds to the following inputs:

```
D = 4'b0110
Clock = 1
Resetn = 0
W_en = 1
Q_sel = 2'b00

Output:
Q[0] = 0
Q[1] = 1
Q[2] = 1
Q[3] = 0
```

<a name="3.3.6.7"></a>

### 3.3.6.7

Write a Verilog module to produce a 4-bit register that responds to the following inputs:

```
D = 4'b0110
Clock = 1
Resetn = 0
W_en = 1
Q_sel = 2'b00

Output:
Q[0] = 0
Q[1] = 1
Q[2] = 1
Q[3] = 0
```

<a name="3.3.6.8"></a>

### 3.3.6.8

Write a Verilog module to produce a 4-bit register that responds to the following inputs:

```
D = 4'b0110
Clock = 1
Resetn = 0
W_en = 1
Q_sel = 2'b00

Output:
Q[0] = 0
Q[1] = 1
Q[2] = 1
Q[3] = 0
```

<a name="3.3.6.9"></a>

### 3.3.6.9

Write a Verilog module to produce a 4-bit register that responds to the following inputs:

```
D = 4'b0110
Clock = 1
Resetn = 0
W_en = 1
Q_sel = 2'b00

Output:
Q[0] = 0
Q[1] = 1
Q[2] = 1
Q[3] = 0
```

<a name="3.3.6.10"></a>

### 3.3.6.10

Write a Verilog module to produce a 4-bit register that responds to the following inputs:

```
D = 4'b0110
Clock = 1
Resetn = 0
W_en =