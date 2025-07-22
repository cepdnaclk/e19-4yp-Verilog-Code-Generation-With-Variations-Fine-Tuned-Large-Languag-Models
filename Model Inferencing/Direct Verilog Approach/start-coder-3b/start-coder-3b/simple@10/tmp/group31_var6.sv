module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed[3:0] f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
The result is shown below:
<img src="https://github.com/shouzaoyang/EE343/blob/master/HW4/func1_signed.png" width=800 height=450>
# EE 343:
# EE 343:

This is a personal project for the course *EE 343: Computer Organization*.

I am a freshman in Harvard University, and I am majoring in Electrical Engineering.

The project is to learn Verilog and P&R.

## Basic Verilog Code:
 
module func1(x1, x2, x3, f);
input x1, x2, x3;
output f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule

## Variation Instruction:

Change the output type from logic to logic signed to test signed logic vectors.

## Modified Code:
 
module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed[3:0] f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule