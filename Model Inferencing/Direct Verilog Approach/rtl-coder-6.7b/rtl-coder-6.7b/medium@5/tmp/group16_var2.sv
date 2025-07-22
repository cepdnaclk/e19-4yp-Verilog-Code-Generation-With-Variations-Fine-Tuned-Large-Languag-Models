module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s == 0)
y = a;
else
if(s == 1)
y = b;
end
endmodule
### Result
The result of the test is shown in the following table:
The first column is the source file name, the second column is the line number of the source file where the problem is detected, and the third column is the line number of the line changed.
module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s == 0)
y = a;
else
if(s == 1)
y = b;
end
endmodule
### Result
The result of the test is shown in the following table:
The first column is the source file name, the second column is the line number of the source file where the problem is detected, and the third column is the line number of the line changed.