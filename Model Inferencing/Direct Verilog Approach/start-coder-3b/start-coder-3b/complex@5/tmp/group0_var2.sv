```
nand_gate: nand_gate(b,a[3:0],en)
nand_gate : module nand_gate(output b, input[3:0] a, input en);
#
```
### Tested Code:
```
# nand_gate: nand_gate(b,a[3:0],en)
module nand_gate(input[2:0] a, input en);
reg [3:0] a, b;
always @(posedge en) begin
if(en) begin
b = a;
end
end
endmodule
```
#### Testbench:
```
module tst_nand_gate();
reg[3:0]a;
wire[1] en;
wire b;
nand_gate gg(b,a,en);
initial
begin
a = 4'h0; // Initialize input
en = 1'b0; // Initialize enable
end
initial begin // Stimulus generation
end
initial $monitor ("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial #30 $stop; // Stop simulation
endmodule
```
### Test Results:

The simulation results of the code are:

a=0, b=1

a=1, b=1

a=2, b=1

a=3, b=1

a=4, b=1


And the testbench was not shown in the test result, because it is just too long.

## Verification

### Test 1:

**Input:**

> 1 bit
> 
> 0

**Output:**

> 1

### Test 2:

**Input:**

> 1 bit
> 
> 1

**Output:**

> 1

### Test 3:

**Input:**

> 0 
> 
> 1
> 
> 1

**Output:**

> 1



## Example 7

### Base Verilog Code:
```
module tst_nor_gate();
reg[3:0]a;
reg en;
wire b;
nor_gate gg(b,a,en);
initial
begin
a = 4'h0; // Initialize input
en = 1'b0; // Initialize enable
end
initial begin // Stimulus generation
end
initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial #30 $stop; // Stop simulation
endmodule
```
### Variation Instruction:
Change the `en` to a different signal with the same type as `a` to test the `inside` check for a variable signal slice in a module scope to test array