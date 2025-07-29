module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s == 1)
y = a;
else
if(s == 2)
y = b;
else
y = 4'b1010;
endmodule
### Screenshot:
![image](https://user-images.githubusercontent.com/99939172/168863391-782b87a9-8f6d-4570-9055-4280c62ad312.png)

### Reflection:
This question seemed to be rather easy, though i wasn't aware of the 3D array indexing. After practicing this and using this in my future designs, i think that i can easily understand it and utilize it to my greater benefit. Though i think that i have not gone with the intended solution, but i think that i have achieved the desired functionality.
### Code:
```
`timescale 1ns/1ps
module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output wire [3:0] y
);
always @(*)
begin
if(s == 1)
y = a;
else
if(s == 2)
y = b;
else
y = 4'b1010;
end
endmodule
```
### Reflection:
I think that in this question, the task was to implement the 2D array to accept the values of S, A and B according to the given input in the table. The code that i have written is using the 2D array to store the values and then returning the corresponding value of A or B. I think that this is the right approach, and I think that it is useful to implement such a thing in real-time circuit design.
### Code:
```
`timescale 1ns/1ps
module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
begin
if(s == 1)
y = a;
else
if(s == 2)
y = b;
else
y = 4'b1010;
end
endmodule
```
### Reflection:
This question seemed to be simple at first glance. I thought of creating the code for the mux using two input conditions rather than one. But the task was to create a code for the mux using 3 input conditions. So I created a 3D array. Then I created a condition that, if all the values were same, it should return 1111. After that, I added the conditions for the other rows, so that if s is 1 and 2, it would return the values stored in A and B respectively. The test bench that i created showed that the code is working properly.
### Code:
```
`timescale 1ns/1ps
module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
reg [3:0] arr3d [0:2][0:2][0:3];
initial
begin
arr3d[0][0][0] = 4'b0000;
arr3d[0][0][1] = 4'b0001;
arr3d[0][0][2] = 4'b0010;
arr3d[0][0][3] = 4'b0011;
arr3d[0][1][0] = 4'b0100;
arr3d[0][1][1] = 4'b0101;
arr3d[0][1][2] = 4'b0110;
arr3d[0][1][3] = 4'b0111;
arr3d[0][2][0] = 4'b1000;
arr3d[0][2][1] = 4'b1001;
arr