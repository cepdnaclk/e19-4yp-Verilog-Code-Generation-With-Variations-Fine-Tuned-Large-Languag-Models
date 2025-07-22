module example4(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [1:0, 3:0] Sum, RegSum;
wire [1:0, 3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule

### 09/22/2019: Verilog HDL Code
module example5(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [1:0, 3:0] Sum, RegSum;
wire [1:0, 3:0] R1, R2;
reg4 R1 (Sum, Clock, Reset, RegSum);
wire [1:0, 3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign R2 = Data + RegSum;
assign Sum = R1 + R2;
endmodule

### 09/25/2019: Verilog HDL Code
module example1(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [2:0] RegSum;
reg4 R1 (Data, Clock, Reset, RegSum);
endmodule

### 09/25/2019: Verilog HDL Code
module example2(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [2:0] RegSum, Sum;
reg4 R1 (Data, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule

### 09/28/2019: Verilog HDL Code
module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule

### 09/28/2019: Verilog HDL Code
module example4(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [1:0, 3:0] Sum, RegSum;
wire [1:0, 3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule

### 09/28/2019: Verilog HDL Code
module example5(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [1:0, 3:0] Sum, RegSum;
wire [1:0, 3:0] R1, R2;
reg4 R1 (Sum, Clock, Reset, RegSum);
wire [1:0, 3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign R2 = Data + RegSum;
assign Sum = R1 + R2;
endmodule

### 09/28/2019: Verilog HDL Code
module example6(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output RegSum;
reg4 R1 (Data, Clock, Reset, RegSum);
endmodule

### 09/28/2019: Verilog HDL Code
module example7(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
reg4 R1 (Data, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule

### 09/28/2019: Verilog HDL Code
module example8(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] R1, R2;
reg4 R1 (Data, Clock, Reset, RegSum);
assign R2 = Data + RegSum;
assign Sum = R1 + R2;
endmodule

### 09/28/2019: Verilog HDL Code
module example9(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule

### 09/28/2019: Verilog HDL Code
module example10(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule

### 09/28/2019: Verilog HDL Code
module example11(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
reg4 R1 (Data, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule

### 09/28/2019: Verilog HDL Code
module example12(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [1:0, 3:0] Sum, RegSum;
wire [1:0, 3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule

### 09/28/2019: Verilog HDL Code
module example13(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [1:0, 3:0] Sum, RegSum;
wire [1:0, 3:0] R1, R2;
reg4 R1 (Sum, Clock, Reset, RegSum);
wire [1:0, 3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign R2 = Data + RegSum;
assign Sum = R1 + R2;
endmodule

### 09/28/2019: Verilog HDL Code
module example14(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [1:0, 3:0] Sum, RegSum;
wire [1:0, 3:0] R1, R2;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign R2 = Data + RegSum;
assign Sum = R1 + R2;
endmodule

### 09/28/2019: Verilog HDL Code
module example15(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [1:0, 3:0] Sum, RegSum;
wire [1:0, 3:0