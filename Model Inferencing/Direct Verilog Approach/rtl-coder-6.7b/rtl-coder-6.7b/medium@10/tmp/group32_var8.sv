module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
wire do; // Output must be a reg or wire
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk)
case (do[2:0])
2'b00 : do[2:0] = 2'b00;
2'b01 : do[2:0] = 2'b01;
2'b10 : do[2:0] = 2'b10;
2'b11 : do[2:0] = 2'b11;
endcase
endmodule
### Case Statement:
When the case expression is known, the syntax of the case statement is as follows:
case (case expression)
     {case list} : {statement list};
     {case list} : {statement list};
    .
    .
    .
     default : {statement list};
endcase
### Case Operation
The case expression is compared with each case list. If the case expression matches the case list, the statement list associated with the case list is executed. If the case expression does not match any case list, the default statement list is executed. If the case expression matches more than one case list, the statement list associated with the first matched case list is executed.

### Case Operation Example:
module dff(do,di,clk);
output do;
input di,clk;
reg do;
initial
do=1'b0;
always@(negedge clk)
case (do)
1'b0 : do = 1'b1;
1'b1 : do = 1'b0;
endcase
endmodule
### Case Operation Example:
module dff(do,di,clk);
output do;
input di,clk;
reg do;
initial
do=1'b0;
always@(negedge clk)
case (do)
1'b0 : do = 1'b1;
1'b1 : do = 1'b0;
endcase
endmodule
### Case Operation Example