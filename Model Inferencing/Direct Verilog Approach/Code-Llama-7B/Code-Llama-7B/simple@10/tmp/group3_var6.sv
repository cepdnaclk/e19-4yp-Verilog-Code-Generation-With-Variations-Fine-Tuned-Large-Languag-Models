module top_mod(a_in, b_in, cin, sum, cout);
input [3:0] a_in, b_in, cin;
output [3:0] sum, cout;
full_adder fa0(a_in[3], b_in[3], cin, sum[3], cout);
full_adder fa1(a_in[