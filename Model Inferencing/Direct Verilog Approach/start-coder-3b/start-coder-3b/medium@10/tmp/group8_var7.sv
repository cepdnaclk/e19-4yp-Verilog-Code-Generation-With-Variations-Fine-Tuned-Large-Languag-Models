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
if(i[0] & i[1] )      // Added the if statement
begin
$stop;
end
endmodule
### Simulation Result:

### Observations:
From the waveform above shows that the simulation stops when input i[0] =1 and i[1] = 1. We can see that the output o is always 0100 when i[0] =1 and i[1] = 1. And the output is always 0101 when i[0] =1 and i[1] = 0.

## 7.05 Dec2_4bch.v

### Base Verilog Code:
module tst_dec2_4bch();
wire [3:0]o;
reg[1:0] i;
reg en;
dec2_4bch dec(o,i,en);
initial
begin
i =2'b00;
en =1'b1; // Enable not used in dec2_4bch
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial $monitor ($time, " En = %b ", en);
initial #14 $stop; // Stop simulation endmodule ### Variation Instruction: Add a if statement using inside with an indexed part select as the operand being tested. ### Modified Code: module tst_dec2_4bch(); wire [3:0]o; reg[1:0] i; reg en; dec2_4bch dec(o,i,en); initial begin i =2'b00; en =1'b1; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); initial$monitor ($time, " En = %b ", en); if(en) // Added the if statement begin$stop;
end
endmodule
### Simulation Result:

### Observations:
From the simulation result above we can see that the code stops when En =0 and En = 1. And the output o is always 0100 when En =1. And the output is always 0101 when En =0.

## 7.06 Dec2_4bch.v

### Base Verilog Code:
module tst_dec2_4bch();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4bch
dec2_4bch dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation endmodule ### Variation Instruction: Add an else statement under the if statement. ### Modified Code: module tst_dec2_4bch(); wire [3:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4bch dec2_4bch dec(o,i); initial begin i =2'b00; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); if(i[0] & i[1] ) begin$stop;
end
else
begin
initial $stop; end endmodule ### Simulation Result: ### Observations: From the waveform above shows that the simulation stops when input i[0] =1 and i[1] = 1. We can see that the output o is always 0100 when i[0] =1 and i[1] = 1. And the output is always 0101 when i[0] =1 and i[1] = 0. ## 7.07 Dec2_4bch.v ### Base Verilog Code: module tst_dec2_4bch(); wire [3:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4bch dec2_4bch dec(o,i); initial begin i =2'b00; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); if(i[0] & i[1] ) begin$stop;
end
else
begin
initial $stop; end endmodule ### Variation Instruction: Add an else statement under the if statement before the initial stop. ### Modified Code: module tst_dec2_4bch(); wire [3:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4bch dec2_4bch dec(o,i); initial begin i =2'b00; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); if(i[0] & i[1] ) begin$stop;
end
else
begin
initial $stop; end endmodule ### Simulation Result: ### Observations: From the waveform above shows that the simulation stops when input i[0] =1 and i[1] = 1. We can see that the output o is always 0100 when i[0] =1 and i[1] = 1. And the output is always 0101 when i[0] =1 and i[1] = 0. ## 7.08 Dec2_4bch.v ### Base Verilog Code: module tst_dec2_4bch(); wire [3:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4bch dec2_4bch dec(o,i); initial begin i =2'b00; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); if(i[0] & i[1] ) begin$stop;
end
else
begin
initial $stop; end endmodule ### Variation Instruction: Add an else statement before the initial stop. ### Modified Code: module tst_dec2_4bch(); wire [3:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4bch dec2_4bch dec(o,i); initial begin i =2'b00; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); if(i[0] & i[1] ) begin$stop;
end
else
begin
initial $stop; end endmodule ### Simulation Result: ### Observations: The simulation is not stopped when i[0] =1 and i[1] = 1. And the output is always 0100 when i[0] =1 and i[1] = 1. But when i[0] =1 and i[1] =0,the output is 0101, the output o cannot be 0110. ## 7.09 Dec2_4bch.v ### Base Verilog Code: module tst_dec2_4bch(); wire [3:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4bch dec2_4bch dec(o,i,en); initial begin i =2'b00; en =1'b1; // Enable not used in dec2_4bch endinitial$monitor ($time, " output o = %b, input i = %b ", o,i); initial$monitor ($time, " En = %b ", en); initial $stop; // Stop simulation endmodule ### Variation Instruction: Add an else statement inside the if statement. ### Modified Code: module tst_dec2_4bch(); wire [3:0]o; reg[1:0] i; //reg en; // Enable not used in dec2_4bch dec2_4bch dec(o,i,en); initial begin i =2'b00; en =1'b1; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); initial$monitor ($time, " En = %b ", en); if(en) // Added the if statement begin //Added the empty else statement to the if statement$stop;
end
else
begin
initial $stop; end endmodule ### Simulation Result: ## 7.10 Dec2_4bch.v ### Base Verilog Code: module tst_dec2_