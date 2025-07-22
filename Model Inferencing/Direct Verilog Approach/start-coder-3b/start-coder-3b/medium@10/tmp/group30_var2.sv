module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @*
begin
if (r)
out = 0;
else
out = data;
end
endmodule

# 20.4.2022

## 06.03.2022

### Procedural Block with a Statement
Procedural blocks can contain statements, and statements are executed sequentially. At program start, all statements are executed, in order, from top to bottom.

Procedural blocks can contain statements, and statements are executed sequentially. At program start, all statements are executed, in order, from top to bottom.
### Example:
module proc_block;
initial
begin
$display("Initial block"); end endmodule A complete example: module proc_block; initial begin$display("Initial block");
begin
for (integer i = 0; i < 10; i = i + 1)
$display("Block with statement"); end end endmodule ### Example 2: module proc_block; initial begin$display("Initial block");
begin
for (integer i = 0; i < 10; i = i + 1) begin
$display("Block with statement"); end end end module ### Example 3: module proc_block; initial begin$display("Initial block");
begin
for (integer i = 0; i < 10; i = i + 1) begin
$display("Block with statement"); end end end module ### Example 4: module proc_block; initial begin$display("Initial block");
begin
integer i;
for (i = 0; i < 10; i = i + 1)
begin
$display("Block with statement"); end end end module ### Example 5: module proc_block; initial begin$display("Initial block");
begin
integer i;
for (i = 0; i < 10; i = i + 1)
$display("Block with statement"); end end module ### Example 6: module proc_block; initial begin$display("Initial block");
begin
integer i;
integer i;
for (i = 0; i < 10; i = i + 1)
$display("Block with statement"); end end module ### Example 7: module proc_block; initial begin$display("Initial block");
begin
integer i;
integer i;
for (i = 0; i < 10; i = i + 1) begin
$display("Block with statement"); end end end module ### Example 8: module proc_block; initial begin$display("Initial block");
begin
integer i;
integer i;
for (i = 0; i < 10; i = i + 1) begin
integer i;
$display("Block with statement"); end end end module ### Example 9: module proc_block; initial begin$display("Initial block");
begin
integer i;
integer i;
for (i = 0; i < 10; i = i + 1) begin
integer i;
$display("Block with statement"); end end end module ### Example 10: module proc_block; initial begin$display("Initial block");
begin
integer i;
integer i;
for (i = 0; i < 10; i = i + 1) begin
integer i;
$display("Block with statement"); integer i; integer i; end end end module ### Example 11: module proc_block; initial begin$display("Initial block");
begin
integer i;
integer i;
for (i = 0; i < 10; i = i + 1) begin
integer i;
$display("Block with statement"); integer i; integer i; end end end module ### Example 12: module proc_block; initial begin$display("Initial block");
begin
integer i;
integer i;
for (i = 0; i < 10; i = i + 1) begin
integer i;
integer i;
$display("Block with statement"); integer i; integer i; end end end module ## 21.01.2022 ### Procedural Block with a Statement Procedural blocks can contain statements, and statements are executed sequentially. At program start, all statements are executed, in order, from top to bottom. ### Example: module proc_block; initial begin$display("Initial block");
end
endmodule
A complete example:
module proc_block;
initial begin
$display("Initial block"); begin for (integer i = 0; i < 10; i = i + 1)$display("Block with statement");
end
end
endmodule

### Example 2:

module proc_block;
initial begin
$display("Initial block"); begin for (integer i = 0; i < 10; i = i + 1)$display("Block with statement");
end
end
endmodule

### Example 3:

module proc_block;
initial begin
$display("Initial block"); begin for (integer i = 0; i < 10; i = i + 1)$display("Block with statement");
end
end
endmodule

### Example 4:

module proc_block;
initial begin
$display("Initial block"); begin integer i; for (i = 0; i < 10; i = i + 1)$display("Block with statement");
end
end
endmodule

### Example 5:

module proc_block;
initial begin
$display("Initial block"); begin integer i; for (i = 0; i < 10; i = i + 1)$display("Block with statement");
end
end
endmodule

### Example 6:

module proc_block;
initial begin
$display("Initial block"); begin integer i; integer i; for (i = 0; i < 10; i = i + 1)$display("Block with statement");
end
end
endmodule

### Example 7:

module proc_block;
initial begin
$display("Initial block"); begin integer i; integer i; for (i = 0; i < 10; i = i + 1)$display("Block with statement");
end
end
endmodule

### Example 8:

module proc_block;
initial begin
$display("Initial block"); begin integer i; integer i; for (i = 0; i < 10; i = i + 1)$display("Block with statement");
integer i;
end
end
end
endmodule

### Example 9:

module proc_block;
initial begin
$display("Initial block"); begin integer i; integer i; for (i = 0; i < 10; i = i + 1)$display("Block with statement");
integer i;
end
end
end
endmodule

### Example 10:

module proc_block;
initial begin
$display("Initial block"); begin integer i; integer i; for (i = 0; i < 10; i = i + 1)$display("Block with statement");
integer i;
end
end
end
endmodule

### Example 11:

module proc_block;
initial begin
$display("Initial block"); begin integer i; integer i; for (i = 0; i < 10; i = i + 1)$display("Block with statement");
integer i;
end
end
end
endmodule

### Example 12:

module proc_block;
initial begin
$display("Initial block"); begin integer i; integer i; for (i = 0; i < 10; i = i + 1)$display("Block with statement");
integer i;
end
end
end
endmodule

## 21.02.2022

### Base Verilog Code:
module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
out = data;
end
endmodule
### Variation Instruction:
Use the $display statement inside the initial block, to print to the command line. ### Modified Code: module dff_with_reset(data, clock, r, out); input clock, r, data; output out; reg out; initial begin$display("Initial block");
end

always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
out = data;
end
endmodule

# 21.02.2022

## 11.01.2022

### Verilog Programming: Flops

If we want to have a simple DFF with the initial value