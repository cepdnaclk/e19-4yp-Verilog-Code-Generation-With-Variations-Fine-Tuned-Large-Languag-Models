#### Testbench Code:
`define test(s,c,z) \
initial begin \
$display("s=%b c=%b z=%b", s,c,z); \
$finish; \
end
### Main Code:
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
wire [3:0] a;
assign a = c[s];
assign z = a[0];
`test(00, 0010, 0);
`test(00, 1010, 1);
`test(01, 0101, 0);
`test(01, 1101, 1);
`test(10, 0001, 0);
`test(10, 1001, 1);
`test(11, 0011, 0);
`test(11, 1011, 1);
endmodule
### Output Code:
$./mux41b.v | vvp -l
Running with 16GiB RAM.
s=00 c=0010 z=0
s=00 c=1010 z=1
s=01 c=0101 z=0
s=01 c=1101 z=1
s=10 c=0001 z=0
s=10 c=1001 z=1
s=11 c=0011 z=0
s=11 c=1011 z=1