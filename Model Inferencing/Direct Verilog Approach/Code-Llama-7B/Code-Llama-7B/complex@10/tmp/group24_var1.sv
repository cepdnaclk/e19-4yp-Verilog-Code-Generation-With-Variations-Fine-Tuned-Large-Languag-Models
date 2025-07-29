The modified testbench would include the following modifications:
```
reg clk,en,int, BCD_in_valid; // Clock, Enable, Interrupt, BCD_in_Valid inputs
reg [7:0] BCD_in;

initial
begin
BCD_in_valid = 1'b0;
BCD_in = 8'b0;
int=1'b0;clk=1'b0;en=1'b0; // Initialize
end
// Testcase for BCD_in
initial
begin
#5 BCD_in_valid = 1'b1;
BCD_in = 8'h0A;
#5 BCD_in_valid = 1'b0;
#20 BCD_in_valid = 1'b1;
BCD_in = 8'h00;
#5 BCD_in_valid = 1'b0;
#20 BCD_in_valid = 1'b1;
BCD_in = 8'hA0;
#5 BCD_in_valid = 1'b0;
#20 BCD_in_valid = 1'b1;
BCD_in = 8'h12;
#5 BCD_in_valid = 1'b0;
#20 BCD_in_valid = 1'b1;
BCD_in = 8'h23;
#5 BCD_in_valid = 1'b0;
#20 BCD_in_valid = 1'b1;
BCD_in = 8'h34;
#5 BCD_in_valid = 1'b0;
#20 BCD_in_valid = 1'b1;
BCD_in = 8'h45;
#5 BCD_in_valid = 1'b0;
#20 BCD_in_valid = 1'b1;
BCD_in = 8'h56;
#5 BCD_in_valid = 1'b0;
#20 BCD_in_valid = 1'b1;
BCD_in = 8'h67;
#5 BCD_in_valid = 1'b0;