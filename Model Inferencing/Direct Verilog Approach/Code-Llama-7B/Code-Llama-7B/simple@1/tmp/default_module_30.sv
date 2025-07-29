module netdelay1(x,y);
input x;
output reg [31:0] y;
wire #(2,1) nn;
not (nn,x);
assign y={y[30:0],nn};
endmodule
### Instruction Description:
The code is the same as the previous one.
### Testbench Code:
```
module netdelay1_tb();
reg x;
wire [31:0] y;
wire y_exp;
initial begin
x=0;
#20;
x=1;
#20;
x=0;
#20;
x=1;
end
netdelay1 DUT(x,y);
assign y_exp=x&1;

initial begin
$dumpfile("netdelay1.vcd");
$dumpvars;
end
endmodule
```
### Expected Results
![](netdelay1.png)

### Implementation Flow:
1. Create a new file named netdelay1.v.
2. Add code as per the following guidelines.
3. Compile the code and generate a netlist.
4. Implement the logic using the clock enable (CE) and clock gating (CG) attributes.
5. Run netlist