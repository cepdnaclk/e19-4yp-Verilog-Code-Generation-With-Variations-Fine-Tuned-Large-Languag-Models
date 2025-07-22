module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [7:0] arr[10];
integer i;
always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
	i <=0;
while(i<10)
begin
arr[i]<=i;
i<=$display("%b",x);
end 
end
endmodule

### Code Output:
10000000
01000000
00100000
00010000
00001000
00000100
00000010
00000001



### Code Snapshot:
![image](https://user-images.githubusercontent.com/112381395/215965402-8949f1cc-9a3b-490c-b6ae-c7254b0e6f1a.png)


![image](https://user-images.githubusercontent.com/112381395/215965411-58129ce8-6058-4e7a-9a06-a4aea1419b89.png)