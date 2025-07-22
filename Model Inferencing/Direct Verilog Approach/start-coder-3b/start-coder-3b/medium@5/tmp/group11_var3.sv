module aoi2(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1; // Intermediate signals
initial begin
end
// Dataflow assignments for AND, OR, and NOT operations
assign e = a && b;
assign f = c && d;
assign g1 = e || f;
assign g = ~g1; // Final AOI output
endmodule
### References 85
2018-10-27 19:11:39 1728
Using Initial Declarations in Verilog 22
Exercises 2
2. Module instantiation 1. Consider the following module definition.
module or2 ( y, a, b,
input [1:0] a,
input [1:0] b,
input  en
);
output y;
wire  en_next;

assign en_next = en;
assign y = a | b;
endmodule
2. Which is the closest equivalent to the initial block in a Verilog programming language, with a
given dataflow specification for module or2?
a. begin
end
b. or2 ( y, a, b,
input [1:0] a,
input [1:0] b,
input  en )
c. initial begin
end
d. initial begin
end
3. Consider the following module instantiation.
or2   (y_3, a_3, b_3,
a_2, b_2,
en_2)
y_1, a_1, b_1,
y_2, a_2, b_2,
en_1)
2018-10-27 19:11:39 1729
Using Initial Declarations in Verilog 23
Exercises 3
3. Which of the following expressions is equivalent to the initial block statement?
a. begin
end
b. begin
end
c. or2 ( y, a, b,
input [1:0] a,
input [1:0] b,
input en
)
d. or2 ( y, a, b,
input [1:0] a,
input [1:0] b,
input  en )
2. In the module or2, which of the following statements are valid initial declarations?
a. initial begin
end
b. initial begin
end
c. assign y = a | b;
d. begin
end
4. Consider the following dataflow description of a module.
module or2 ( y, a, b,
input [1:0] a,
input [1:0] b,
input  en
);
output y;
wire  en_next;

assign en_next = en;
assign y = a | b;
endmodule
5. Which of the following statements are valid initial declarations?
a. begin
end
b. begin
end
c. assign y = a | b;
d. initial begin
end
2018-10-27 19:11:39 1730
Using Initial Declarations in Verilog 24
Exercises 4
Exercises 4
6. Which of the following statements are valid initial declarations?
a. begin
end
b. begin
end
c. assign y = a | b;
d. initial begin
end
7. Consider the following initial block statement.
initial
{en_next = en;}
8. Which of the following statements are valid dataflow descriptions that correspond to the initial block?
a. begin
end
b. begin
end
c. begin
end
d. begin
end
9. Consider the following initial block statement.
initial
{en_next = en;}
Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign en_next = en;
d. begin
end
2018-10-27 19:11:39 1731
Using Initial Declarations in Verilog 25
Exercises 5
25. Consider the following initial block statement.
initial
{en_next = en;}
Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign en_next = en;
d. begin
end
10. Consider the following initial block statement.
initial
{en_next = en;}
11. Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign en_next = en;
d. begin
end
26. Consider the following initial block statement.
initial
{en_next = en;}
Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign en_next = en;
d. begin
end
12. Consider the following code segment.
initial
{
for (i = 0; i <= 8000; i = i + 1)
{
if (en)
{
y = x;
}
}
}
27. Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign y = x;
d. begin
end
28. Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign y = x;
d. begin
end
13. Consider the following initial block statement.
initial
{
for (i = 0; i <= 8000; i = i + 1)
{
if (en)
{
y = x;
}
}
}
Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign y = x;
d. begin
end
14. Consider the following initial block statement.
initial
{
for (i = 0; i <= 8000; i = i + 1)
{
if (en)
{
y = x;
}
}
}
Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign y = x;
d. begin
end
15. Consider the following initial block statement.
initial
{
for (i = 0; i <= 8000; i = i + 1)
{
if (en)
{
y = x;
}
}
}
Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign y = x;
d. begin
end
2018-10-27 19:11:39 1732
Using Initial Declarations in Verilog 26
Exercises 6
Exercises 6
29. Consider the following initial block statement.
initial
{
for (i = 0; i <= 8000; i = i + 1)
{
if (en)
{
y = x;
}
}
}
Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign y = x;
d. begin
end
30. Consider the following initial block statement.
initial
{
for (i = 0; i <= 8000; i = i + 1)
{
if (en)
{
y = x;
}
}
}
Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign y = x;
d. begin
end
16. Consider the following initial block statement.
initial
{
for (i = 0; i <= 8000; i = i + 1)
{
if (en)
{
y = x;
}
}
}
Which of the following statements are valid dataflow descriptions that correspond to the initial block in this example?
a. begin
end
b. begin
end
c. assign y = x;
d. begin
end
31. Consider the following initial block statement.
initial
{
for (i = 0; i <= 8000; i = i + 1)
{
if (en)