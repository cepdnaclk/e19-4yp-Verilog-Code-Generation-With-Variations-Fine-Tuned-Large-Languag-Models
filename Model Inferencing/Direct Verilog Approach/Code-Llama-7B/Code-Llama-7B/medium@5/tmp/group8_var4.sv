module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
reg en; // Add Enable (Active-High) input

dec2_4beh dec(o,i,en);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b, en = %b ", o,i, en);
initial #14 $stop; // Stop simulation
endmodule
### Test Bench Scope:
* Initial State
* Initial state of i = 00
* Initial state of o = X
* Initial state of en = U
* Initial state of i = 01
* Initial state of o = 0
* Initial state of i = 10
* Initial state of o =