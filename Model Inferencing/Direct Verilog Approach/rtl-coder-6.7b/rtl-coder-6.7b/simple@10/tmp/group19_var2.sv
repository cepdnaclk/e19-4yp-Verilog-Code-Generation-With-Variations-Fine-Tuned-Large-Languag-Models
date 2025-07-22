module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;
endmodule
### Testbench Code:
module testbench();
reg Clock, Resetn;
wire [3:0]Q;
reg [3:0]D;
dff_inst dut(.D,.Clock,.Resetn,.Q);
initial begin
Clock = 0;
Resetn = 1;
$display("\nTest 1: Set D to 4'b0101 and Clock to 0, Reset to 1");
D = 4'b0101;
#1
$display("\nTest 2: Set D to 4'b0110 and Clock to 1");
D = 4'b0110;
Clock = 1;
#1
$display("\nTest 3: Set D to 4'b1000 and Clock to 0");
D = 4'b1000;
Clock = 0;
#1
$display("\nTest 4: Set D to 4'b0001 and Clock to 1");
D = 4'b0001;
Clock = 1;
$finish;
end
always
begin
#5
Clock = ~Clock;
end
endmodule
### Notes:
As you can see, I used a 4-bit "D" variable with the 4-bit output "Q" variable.  I also used $finish to make sure the clock doesn't continue to run.  This can be changed to any desired value.