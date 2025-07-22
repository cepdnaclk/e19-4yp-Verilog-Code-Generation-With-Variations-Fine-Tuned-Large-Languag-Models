module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if (s==0)
y = a;
else
y = b;
endmodule
### Proposed Solution

• Inspired by a similar issue with a previous post on the same topic, I propose to change the way the if block is generated to be consistent with the if else block syntax of verilog

If (s == 0)
Do something
If (!s)
Do something else

• The proposed solution will not change the behaviour of the code and will have the same code coverage

### Why it is the better solution?

• If block is modified to be more readable

### What are the drawbacks of proposed solution?

• There's no way to make the code more maintainable as it is now

### How to test the proposed solution?

• If a test is added to check the correctness of the proposed solution, it will make sure that the proposed solution is consistent with the original one and will be very useful to check the code coverage.