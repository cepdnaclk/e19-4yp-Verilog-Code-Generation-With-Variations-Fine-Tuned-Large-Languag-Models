module SchedDelayA;
class A;
endclass
A a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Testbench:
module tb;
// Auxiliary variables
reg clk;
// Clock generator
initial begin
 clk = 1;
 forever #10 clk = ~clk;
end
//
A a0, a1;
initial begin
 a0 = new; a1 = new;
end
//
reg [1:0] sel;
//
always @(sel[0], sel[1]) $display("sel=%b", sel);
//
initial begin
 sel = 2'b00; #20;
 sel = 2'b01; #20;
 sel = 2'b10; #20;
 sel = 2'b11; #20;
 $finish;
end
endmodule
### Expected Result:
schedDelayA.sv:3:1: error: Illegal LHS reference to type "A"
schedDelayA.sv:3:1: error: Illegal LHS reference to type "A"
schedDelayA.sv:5:1: error: Illegal LHS reference to type "A"
### Issue Description:
Using associative array operator on an instance of a class should not return an error.