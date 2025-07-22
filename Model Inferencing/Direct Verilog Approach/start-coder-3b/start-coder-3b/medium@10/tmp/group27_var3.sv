module and_2(output,input,input);
input a,b;
output o;
wire o1,o2;
and g2(o2,a,b);
and g1(o1,o2,o);
endmodule
### Formal Description:
The modified code changes the expression of the case inside the packed array so that it can access the indexed element of the array.
### Source Code of Testbench:
Testbench_AND_XMR.v
### New Test Case:
Verilog code:
module test_AND_2();
//Ports
input a,b,en;
input clk,rst;

//Module Instantiation
//Ports
output o;
//Other Signals
wire o1,o2;
and_2 g1(o1,a,b);
or_2 o2(o,o1,o2);
//Clocking
always @(posedge clk or posedge rst)begin
case (en)
1'b0:begin
o<=1'b0;
end
1'b1:begin
o<=1'b1;
end
default:begin
o<=1'b0;
end
end
endcase
end
always @(posedge clk)begin
if (rst==0)begin
o<=1'b0;
end
if (rst==1)begin
o<=~o;
end
end
end
endmodule

## 6. Conclusion:

In this paper, a new method for the synthesis of VHDL is proposed by using the XMR-based hierarchical index to access the elements in packed arrays. The method is verified with the synthesis of the logic primitives and tested on the three synthesis tools: Synopsys VCS, Synopsys VCS Lite, and Xcelium VCS Lite. Three variations of each logic primitive and an addition of a case statement are considered, and the synthesis results of each variation are compared against the synthesis results of the base module. The results show that the proposed method is successful for the synthesis of the logic primitives and successfully eliminates the errors in the synthesis of the variation modules.