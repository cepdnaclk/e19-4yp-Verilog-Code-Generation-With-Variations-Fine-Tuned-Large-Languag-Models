```verilog
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

//Added by 
reg [15:0] Data;

always @(posedge DataIn)
begin
	begin 
		Data <= DataIn;
	end
end

assign DataOut = Data;
endmodule
```
### Testbench:
```verilog
module testbench_main();
reg [7:0] DataIn;
wire [7:0] DataOut;
wire ControlSignals;

DataComponent DUT(.DataIn(DataIn),.DataOut(DataOut),.ControlSignals(ControlSignals));


initial begin
	$dumpfile("dump_file.vcd");
	$dumpvars(0,testbench_main);
	DataIn = 12;
	ControlSignals = 8'b00000000;
	$dumpvars(1,testbench_main);
	DataIn = 13;
	ControlSignals = 8'b00000001;
	$dumpvars(1,testbench_main);
	DataIn = 14;
	ControlSignals = 8'b00000010;
	$dumpvars(1,testbench_main);
	DataIn = 15;
	ControlSignals = 8'b00000011;
	$dumpvars(1,testbench_main);
	DataIn = 16;
	ControlSignals = 8'b00000100;
	$dumpvars(1,testbench_main);
	DataIn = 17;
	ControlSignals = 8'b00000101;
	$dumpvars(1,testbench_main);
	DataIn = 18;
	ControlSignals = 8'b00000110;
	$dumpvars(1,testbench_main);
	DataIn = 19;
	ControlSignals = 8'b00000111;
	$dumpvars(1,testbench_main);
	DataIn = 20;
	ControlSignals = 8'b00001000;
	$dumpvars(1,testbench_main);
	DataIn = 35;
	ControlSignals = 8'b11111111;
	$dumpvars(1,testbench_main);
	DataIn = 36;
	ControlSignals = 8'b00000000;
	$dumpvars(1,testbench_main);

end
initial 
begin
	$finish;
end
endmodule
```
### Verification Output:
The output from the above code is:
![Verify](https://github.com/cse237-fall2019-group10/cse237-fall2019-group10/blob/master/Lab%203/images/Verilog%20Verification%20Output%20%28Rand%20Randomization%29.PNG)
/Lab 4/Lab4/main.c
#include <stdio.h>

int main()
{
    printf("Hello from lab4\n");

    printf("Add 1 to a number:\n");
    int a = 1;
    int b = a + 1;
    printf("%d\n", b);

    printf("Divide by 2 the number b:\n");
    b = b / 2;
    printf("%d\n", b);

    printf("Add 1 to a number:\n");
    a = a + 1;
    printf("%d\n", a);

    printf("Add 1 to a number:\n");
    a = a + 1;
    printf("%d\n", a);

    printf("Add 1 to a number:\n");
    a = a + 1;
    printf("%d\n", a);

    return 0;
}/Lab 6/Lab6/Lab6.c
#include<stdio.h>

//global variables
int a = 0;
int b = 0;

//function definition
int function(int, int);

//main function - entry point
int main()
{
    printf("a is %d\n", a);
    printf("b is %d\n", b);
    int c = 3;
    int d = 4;
    int f = c % d;
    printf("Remainder of %d modulo %d is %d\n", c, d, f);
    f = 4 % 3;
    printf("Remainder of %d modulo %d is %d\n", 4, 3, f);

    int ans = function(a, b);
    printf("Returned answer is %d\n", ans);

    c = 3;
    d = 3;
    ans = function(c, d);
    printf("Returned answer is %d\n