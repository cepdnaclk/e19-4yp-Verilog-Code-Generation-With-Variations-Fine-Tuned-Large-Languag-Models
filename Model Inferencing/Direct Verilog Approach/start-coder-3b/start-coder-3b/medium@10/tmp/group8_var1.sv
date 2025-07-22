module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
// Add code here to check the first condition
if ($realtime <= 15000 ) // Check for time being less than or equal to 15000
initial #14 $stop; // Stop simulation
endmodule
### Testbench Input:
The following input is selected to be checked
i =2'b00

### Expected Output:
The output at the 15,000th clock cycle is checked. The expected o value is 0 which is 2'b00. Since the instruction was placed inside the loop, the output should be 2'b00.

## Testcase 4: 2-bit counter
### Base Verilog Code:
module tst_dec2_2beh();
wire [1:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_2beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation endmodule ### Variation Instruction: Add another condition with an indexed part select as the operand being tested. ### Modified Code: module tst_dec2_2beh(); wire [1:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4beh dec2_2beh dec(o,i); initial begin i =2'b00; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); // Add code here to check the first condition initial #14$stop; // Stop simulation
endmodule

### Testbench Input:
The following input is selected to be checked
i =2'b00

### Expected Output:
The output at the 15,000th clock cycle is checked. The expected o value is 0 which is 2'b00. Since the instruction was placed inside the loop, the output should be 2'b00.

## Testcase 5: 3-bit counter
### Base Verilog Code:
module tst_dec2_3beh();
wire [2:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_3beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation endmodule ### Variation Instruction: Change some part select operations, such as the left shift operator (<<) to a bitwise AND operator (&). ### Modified Code: module tst_dec2_3beh(); wire [2:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4beh dec2_3beh dec(o,i); initial begin i =2'b00; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); // Add code here to check the first condition initial #14$stop; // Stop simulation
endmodule

### Testbench Input:
The following input is selected to be checked
i =2'b00

### Expected Output:
The output at the 15,000th clock cycle is checked. The expected o value is 0 which is 2'b00. Since the instruction was placed inside the loop, the output should be 2'b00.

## Testcase 6: Enabling dec2_3beh

### Base Verilog Code:
module tst_dec2_3beh();
wire [2:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_3beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation endmodule ### Variation Instruction: Place dec2_3beh inside an if statement which has an enable signal as the test condition. ### Modified Code: module tst_dec2_3beh(); wire [2:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4beh dec2_3beh dec(o,i); initial begin i =2'b00; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); if (en)// Place before the begin statement! // Check for time being less than or equal to 15000 initial #14$stop; // Stop simulation
endmodule

The if statement must be placed before the begin statement.
dec2_3beh dec(o,i); is placed after the begin statement.

### Testbench Input:
The following input is selected to be checked
i =2'b00

### Expected Output:
The output at the 15,000th clock cycle is checked. The expected o value is 0 which is 2'b00. Since the instruction was placed inside the loop, the output should be 2'b00.

## Testcase 7: 3-bit counter with an enable signal

### Base Verilog Code:
module tst_dec2_3beh();
wire [2:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_3beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation endmodule ### Variation Instruction: Place dec2_3beh after the if statement with an enable signal as the test condition. ### Modified Code: module tst_dec2_3beh(); wire [2:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4beh dec2_3beh dec(o,i); initial begin i =2'b00; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); if (en) // Place after the begin statement! // Check for time being less than or equal to 15000 initial #14$stop; // Stop simulation
endmodule

The if statement must be placed before the begin statement.
dec2_3beh dec(o,i); is placed after the begin statement.

### Testbench Input:
The following input is selected to be checked
i =2'b00

### Expected Output:
The output at the 15,000th clock cycle is checked. The expected o value is 0 which is 2'b00. Since the instruction was placed inside the loop, the output should be 2'b00.

## Testcase 8: 3-bit counter with a function

### Base Verilog Code:
module tst_dec2_3beh();
wire [2:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_3beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation endmodule ### Variation Instruction: Change the part select operations to a function. ### Modified Code: module tst_dec2_3beh(); wire [2:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4beh dec2_3beh dec(o,i); initial begin i =2'b00; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); // Add code here to check the first condition initial #14$stop; // Stop simulation
endmodule

### Testbench Input:
The following input is selected to be checked
i