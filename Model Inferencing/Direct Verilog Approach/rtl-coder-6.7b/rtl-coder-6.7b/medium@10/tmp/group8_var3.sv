module dec2_4beh(o,i); // Behavioral always @(*)
input[1:0] i;
output reg [3:0]o;
//reg en; // Enable not used in dec2_4beh
always @(*)begin
o[0] = (i[1]==1'b0) & (i[0]==1'b0);
o[1] = (i[1]==1'b0) & (i[0]==1'b1);
o[2] = (i[1]==1'b1) & (i[0]==1'b0);
o[3] = (i[1]==1'b1) & (i[0]==1'b1);
end
endmodule
### Base Testbench Code:
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
initial #14 $stop; // Stop simulation
endmodule
### Variation Testbench Code:
Add an if statement using inside with an indexed part select as the operand being tested.
### Modified Testbench Code:
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
initial #14 $stop; // Stop simulation
endmodule
### Testbench Result:
### Standard Error Messages:
### Standard Warnings:
### Verification Time:
### Standard Information:
### Listing: