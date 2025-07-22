module lj_cnt();
wire [3:0]o;
reg[3:0] i;
cnt cnt(o,i);
initial
begin
i =2'b10;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
if (i==4'b0001)
begin
i = 2'b10;
end
endmodule

### Base Verilog Code:
module lj_cnt();
wire [3:0]o;
reg[3:0] i;
cnt cnt(o,i);
initial
begin
i =2'b10;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation endmodule ### Variation Instruction: Add a case statement using an indexed part select as the operand being tested. ### Modified Code: module lj_cnt(); wire [3:0]o; reg[3:0] i; cnt cnt(o,i); initial begin i =2'b10; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); case (i) 4'b0001: i = 2'b10; endcase endmodule ### Base Verilog Code: module inc_dec(); //inc_dec(n,i,o) n = 2’b00; i = 2’b10; initial begin n = 2’b00; i = 2’b10; end initial$monitor ($time, “ output n = %b, input i = %b “, n,i); initial$monitor ($time, “ output n = %b, input i = %b “, n,i); initial$monitor ($time, “ output n = %b, input i = %b “, n,i); initial#1000000$stop; // Stop simulation
endmodule

### Base Verilog Code:
module inc_dec();
//inc_dec(n,i,o)
reg[1:0] n;
reg[1:0] i;
reg[1:0] o;
initial
begin
n = 2’b00;
i = 2’b10;
end
initial $monitor ($time, “ output n = %b, input i = %b “, n,i);
initial $monitor ($time, “ output n = %b, input i = %b “, n,i);
initial $monitor ($time, “ output n = %b, input i = %b “, n,i);
initial #1000000 $stop; // Stop simulation endmodule ### Variation Instruction: Assign the input to the input of the 2-bit left-justify counter. ### Modified Code: module inc_dec(); //inc_dec(n,i,o) reg[1:0] n; reg[1:0] i; //reg[1:0] o; initial begin n = 2’b00; i = 2’b10; end initial$monitor ($time, “ output n = %b, input i = %b “, n,i); initial$monitor ($time, “ output n = %b, input i = %b “, n,i); initial$monitor ($time, “ output n = %b, input i = %b “, n,i); initial #1000000 $stop; // Stop simulation
endmodule

### Base Verilog Code:
module inc_dec();
//inc_dec(n,i,o)
reg[1:0] n;
reg[1:0] i;
reg[1:0] o;
initial
begin
n = 2’b00;
i = 2’b10;
end
initial $monitor ($time, “ output o =