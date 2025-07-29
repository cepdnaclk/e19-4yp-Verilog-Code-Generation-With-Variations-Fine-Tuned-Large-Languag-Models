module latch (input d, c, output [7:0] q, q_b );
always begin
wait ( c );
end
endmodule
### Test Bench Codes:
module top();
timeunit 1ns; timeprecision 1ps;
logic d=0;
logic c=0;
wire [7:0] q;
wire [7:0] q_b;
latch test(d,c,q,q_b);
defparam test.q=3;
defparam test.q_b=3;
initial begin
## Set Inputs
d=0; c=0;
## Set Delay
#10
## Set Outputs
$display("Simulation Ended");
$stop;
end
endmodule
### Output:
Simulation Ended
### Expected Output:
Simulation Ended
### Notes:
### See Also:
See the following links for more details:
1. https://www.edaplayground.com/x/X47X
2. https://www.edaplayground.com/x/3z8P
3. https://www.edaplayground.com/x/5ZqK
4. https://www.edaplayground.com/x/qBQW
5. https://www.edaplayground.com/x/H8jg
6. https://www.edaplayground.com/x/6Bxg
7. https://www.edaplayground.com/x/2h5y
8. https://www.edaplayground.com/x/9qKX
9. https://www.edaplayground.com/x/7DGg
10. https://www.edaplayground.com/x/7G8G
11. https://www.edaplayground.com/x/7H5q
12. https://www.edaplayground.com/x/7NWq
13. https://www.edaplayground.com/x/7ZGs
14. https://www.edaplayground.com/x/9CpK
15. https://www.