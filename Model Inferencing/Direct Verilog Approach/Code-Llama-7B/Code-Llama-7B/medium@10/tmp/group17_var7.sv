module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = c[0];
endmodule
######
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = c[1];
endmodule
######
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = c[2];
endmodule
######
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = c[3];
endmodule
### Tests:
##### test 5.1:
input:
wire [3:0] c;
c[3] <= 1;
wire [1:0] s;
s[1] <= 1;
s[0] <= 1;
output: 
wire z;
mux41b M1 (
.c(c),
.s(s),
.z(z)
);
expected output: 
z = 1;
##### test 5.2:
input:
wire [3:0] c;
c[2] <= 1;
wire [1:0] s;
s[1] <= 1;
s[0] <= 1;
output: 
wire z;
mux41b M2 (
.c(c),
.s(s),
.z(z)
);
expected output: 
z = 0;
##### test 5.3:
input:
wire [3:0] c;
c[1] <= 1;
wire [1:0] s;
s[1] <= 1;
s[0] <= 1;
output: 
wire z;
mux41b M3 (
.c(c),
.s(s),
.z(z)
);
expected output: 
z = 1;
##### test 5.4:
input:
wire [3:0] c;
c[0] <= 1;
wire [1:0] s;
s[1] <= 1;
s[0] <= 1;
output: 
wire z;
mux41b M4 (
.c(c),
.s(s),
.z(z)
);
expected output: 
z = 0;
##### test 5.5:
input:
wire [3:0] c;
c[3] <= 0;
c[2] <= 1;
c[1] <= 0;
c[0] <= 1;
wire [1:0] s;
s[1] <= 1;
s[0] <= 1;
output: 
wire z;
mux41b M5 (
.c(c),
.s(s),
.z(z)
);
expected output: 
z = 1;
##### test 5.6:
input:
wire [3:0] c;
c[3] <= 1;
c[2] <= 0;
c[1] <= 1;
c[0] <= 0;
wire [1:0] s;
s[1] <= 1;
s[0] <= 1;
output: 
wire z;
mux41b M6 (
.c(c),
.s(s),
.z(z)
);
expected output: 
z = 0;
##### test 5.7:
input:
wire [3:0] c;
c[3] <= 0;
c[2] <= 0;
c[1] <= 1;
c[0] <= 0;
wire [1:0] s;
s[1] <= 1;
s[0] <= 1;
output: 
wire z;
mux41b M7 (
.c(c),
.s(s),
.z(z)
);
expected output: 
z = 0;
##### test 5.8:
input:
wire