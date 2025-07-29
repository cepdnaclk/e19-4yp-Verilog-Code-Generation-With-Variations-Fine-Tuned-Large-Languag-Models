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
### Expected Output:
The output value should be the correct decoded signal for the input 00.
### Pass/Fail Criteria:
The output value should be the correct decoded signal for the input 00.
### Actual Results:
The output value is 0000
### Command Line:
%qpu_sim tst_dec2_4beh.v
### Version:
1.