module example7_10(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
always @(posedge Clock)
begin
	case(D)
	begin
		0: Q1 = 1;
		1: Q1 = 0;
		2: if (Q1 == 1) begin Q2 = 1; end
		3: if (Q1 == 0) begin Q2 = 0; end
	end
endmodule
### Explanation:
This code is the same as example7_9 except for the addition of a case statement with an if statement inside of it.
### Results:
The results shown in figure 7-32 show the results for both the original code and the variation code. Note that the original code shows the value for Q2 set to 0. In the variation code the value for Q2 will always be 1 based on the if statement code within the case statement.
### Figure 7-32: Results for both the original code and the variation code
![image](https://user-images.githubusercontent.com/45797314/136418144-4868e210-08c7-4978-9d5