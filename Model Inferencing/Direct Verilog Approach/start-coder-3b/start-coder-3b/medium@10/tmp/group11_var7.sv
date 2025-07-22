module aoi2(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1; // Intermediate signals
initial
wire[d-1:0] z;
function reg t,t1,t2,t3;
reg [d-1:0] z;
function [c-1:0] t,t1,t2,t3;
always @(t or t1 or t2 or t3)
x = z;
endfunction
endinitial
// Dataflow assignments for AND, OR, and NOT operations
assign e = a && b;
assign f = c && d;
assign g1 = e || f;
assign g = ~g1; // Final AOI output
endmodule
### Execution Results:
No changes.
### Testbench Code:
module tb;
wire g;
wire a,b,c,d;
reg [25:0] count;
initial
$dumpvars(0,tb); // dump initial variable values
// set initial conditions
d=1;
c=0;
b=0;
a=1;
$dumpvars(1,tb); // dump first clock cycle variable values
// test and loop
while (count < 10000) begin
g=a&b|c&d;
count = count + 1;
end
endmodule
### Resulting Dump File:
-17- Verilog-Tutorial/Verilog AOI-Function/testbench_aoi2/tb.vvp
dump vars 0
0, tb
0, g 0
1, a 1
1, b 0
1, c 0
1, d 1
2, g 0
3, g 0
4, g 1
5, g 0
6, g 1
7, g 1
8, g 1
9, g 0
10, g 1
11, g 1
12, g 0
13, g 1
14, g 1
15, g 1
16, g 1
17, g 1
18, g 0
19, g 1
20, g 1
21, g 1
22, g 0
23, g 1
24, g 0
25, g 0
26, g 0
27, g 1
28, g 0
29, g 0
30, g 0
31, g 0
32, g 0
33, g 0
34, g 0
35, g 0
36, g 0
37, g 0
38, g 0
39, g 0
40, g 0
41, g 0
42, g 0
43, g 0
44, g 0
45, g 0
46, g 0
47, g 0
48, g 0
49, g 0
50, g 0
51, g 1
52, g 1
53, g 1
54, g 1
55, g 1
56, g 1
57, g 1
58, g 1
59, g 1
60, g 1
61, g 1
62, g 1
63, g 1
64, g 1
65, g 1
66, g 1
67, g 0
68, g 1
69, g 1
70, g 1
71, g 1
72, g 1
73, g 1
74, g 1
75, g 1
76, g 0
77, g 1
78, g 1
79, g 1
80, g 1
81, g 1
82, g 1
83, g 1
84, g 1
85, g 1
86, g 1
87, g 1
88, g 1
89, g 1
90, g 1
91, g 1
92, g 1
93, g 1
94, g 1
95, g 1
96, g 1
97, g 1
98, g 1
99, g 1
100, g 1
101, g 0
102, g 1
103, g 1
104, g 1
105, g 1
106, g 1
107, g 1
108, g 1
109, g 1
110, g 1
111, g 1
112, g 1
113, g 1
114, g 1
115, g 1
116, g 1
117, g 0
118, g 1
119, g 1
120, g 1
121, g 1
122, g 1
123, g 1
124, g 1
125, g 1
126, g 1
127, g 1
128, g 1
129, g 1
130, g 1
131, g 1
132, g 1
133, g 1
134, g 1
135, g 1
136, g 1
137, g 1
138, g 1
139, g 1
140, g 1
141, g 1
142, g 1
143, g 1
144, g 1
145, g 1
146, g 1
147, g 1
148, g 1
149, g 1
150, g 1
151, g 1
152, g 1
153, g 1
154, g 1
155, g 1
156, g 1
157, g 1
158, g 1
159, g 1
160, g 1
161, g 1
162, g 1
163, g 1
164, g 1
165, g 1
166, g 1
167, g 1
168, g 1
169, g 1
170, g 1
171, g 1
172, g 1
173, g 1
174, g 1
175, g 1
176, g 1
177, g 1
178, g 1
179, g 1
180, g 1
181, g 1
182, g 1
183, g 1
184, g 1
185, g 1
186, g 1
187, g 1
188, g 1
189, g 1
190, g 1
191, g 1
192, g 1
193, g 1
194, g 1
195, g 1
196, g 1
197, g 1
198, g 1
199, g 1
200, g 1
201, g 1
202, g 1
203, g 1
204, g 1
205, g 1
206, g 1
207, g 1
208, g 1
209, g 1
210, g 1
211, g 1
212, g 1
213, g 1
214, g 1
215, g 1
216, g 1
217, g 1
218, g 1
219, g 1
220, g 1
221, g