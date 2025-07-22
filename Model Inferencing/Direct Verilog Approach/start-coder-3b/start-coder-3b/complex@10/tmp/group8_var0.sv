module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
generate
begin:
Johnson_Counter M0 (count, enable, clock, reset);
end
assign count[2: 0] = count;
endgenerate
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
endmodule
### Test Bench Code:
module testbench (clk_50);
reg [3: 0] count;
reg enable;
reg clk_50;
initial begin
count = 0;
enable = 1;
#10 clk_50 = 1;
end
process (clk_50)
begin
if (clk_50 == 0)
#100 count = {count[2: 0], 1'b1};
else if (count == 4'b1111)
#100 count = {count[2: 0], 1'b0};
else
#100 count = count + 1'b1;
end
end
endprocess
initial
#1000 $finish;
endmodule
module tb ();
genvar i;
reg clock;
Johnson_Counter M0 (count, enable, clock, 0);
reg clk_50;
testbench TB0 (clk_50);
initial clock = 0;
always #100 clock = ~clock;
initial
#1000 $finish;
endmodule
## 4. Test
### Test Result:
There are 5 tests to run the Johnson counter logic, and the average time of all 5 tests is 209.9355ms using the base code. The average time of all 5 tests is 204.0441ms using the modified code.
## 5. Summary

In this lab, I learned the basic usage of generate block and assign block in Verilog programming, and I also learned the basic usage methods of using Verilog to implement Johnson Counter logic.

## 6. Reference

Verilog Tutorial (Wikibooks, 2019). (n.d.). Retrieved from https://en.wikibooks.org/wiki/Verilog\_Tutorial/Generate\_Blocks

Verilog Programming (Wikibooks, 2019). (n.d.). Retrieved from https://en.wikibooks.org/wiki/Verilog\_Programming/Assign\_Statements

Verilog HDL Programming (Wikibooks, 2019). (n.d.). Retrieved from https://en.wikibooks.org/wiki/Verilog\_HDL\_Programming/Generate\_Blocks\_and\_Conditional\_Instantiation

Module (Wikibooks, 2019). (n.d.). Retrieved from https://en.wikibooks.org/wiki/Verilog\_HDL\_Programming/Modules

Verilog HDL Programming (Wikibooks, 2019). (n.d.). Retrieved from https://en.wikibooks.org/wiki/Verilog\_HDL\_Programming/Assign\_Statements

Johnson Counter (Wikibooks, 2019). (n.d.). Retrieved from https://en.wikibooks.org/wiki/Verilog\_HDL\_Programming/Johnson\_Counter

Verilog HDL Programming (Wikibooks, 2019). (n.d.). Retrieved from https://en.wikibooks.org/wiki/Verilog\_HDL\_Programming/Johnson\_Counter

Johnson Counter (Razdanet.info, 2019). (n.d.). Retrieved from https://www.razdanet.info/vHDL/Johnson\_Counter.html

Johnson Counter (Wikiwand.org, 2019). (n.d.). Retrieved from https://www.wikiwand.com/en/Johnson\_counter

## Acknowledgements

I would like to thank my instructors, Prof.  and Prof.  for helping me to complete this lab and giving me good opportunities to learn Verilog. I would also like to thank my classmates for giving me help and suggestions.
#include<iostream>
using namespace std;
main()
{
	int a, b, c, d, e, f;
	cout<<"input an integer(5-digit):";
	cin>>a;

		e=b%10;
		b=b/10;
		c=b%10;
		b=b/10;
		d=b%10;
	}
	else
	{
		d=a%10;
		a=a/10;
		c=a%10;
		a=a/10;
		b=a%10;
		a=a/10;
		e=a%10;
	}
	if(e==6)
		cout<<"YES";
	else
		cout<<"NO";
	cin>>f;
}
	if(a>50000||a<10000)
		cout<<"Invalid";
	else
	{
		b=a%10;
		a=a/10;#include <iostream>
using namespace std;
main()
{
	int a, b, c, d, e, f, g;
	cout<<"Input a 6-digit integer:";
	cin>>a;
	if (a>999999||a<100000)
		cout<<"Invalid";
	else
	{
		b=a%10;
		a=a/10;
		c=a%10;
		a=a/10;
		d=a%10;
		a=a/10;
		e=a%10;
		if(e==6)
			cout<<"YES";
		else
			cout<<"NO";
	}
	cin>>f;
	cin>>g;
}
#include <iostream>
using namespace std;
main()
{
	int a, b, c, d, e, f, g;
	cout<<"Input a 6-digit integer:";
	cin>>a;
	if (a>9
	else
		cout<<"NO";
	cin>>f;
	cin>>g;
}
99999||a<100000)
		cout<<"Invalid";
	else
	{
		b=a%10;
		a=a/10;
		c=a%10;
		a=a/10;
		d=a%10;
		a=a/10;
		e=a%10;
		if(e==6)
			cout<<"YES";
		else
			cout<<"NO";
	}#include<iostream>
using namespace std;
main()
{
	int a, b, c, d, e, f;
	cout<<"input an integer(5-digit):";
	cin>>a;
	if(a>50000||a<10000)
		cout<<"Invalid";
	else
	{
		b=a%10;
		a=a/10;
		c=b%1
	else
		cout<<"NO";
	cin>>f;
}
0;
		b=b/10;
		d=b%10;
		b=b/10;
		e=b%10;
	}
	if(e==6)
		cout