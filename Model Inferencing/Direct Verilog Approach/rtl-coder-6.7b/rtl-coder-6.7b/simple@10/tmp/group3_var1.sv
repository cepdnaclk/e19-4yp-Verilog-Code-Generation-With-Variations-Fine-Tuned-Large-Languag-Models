module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Testbench:
module tb_full_adder;
logic a, b, cin, sum, cout;
full_adder adder (a, b, cin, sum, cout);

initial begin
    cin = 1'b0;
    a = 1'b1;
    b = 1'b1;
end
endmodule
### Result:
[Screenshot]()
## Variation D:
### Base Verilog Code:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i