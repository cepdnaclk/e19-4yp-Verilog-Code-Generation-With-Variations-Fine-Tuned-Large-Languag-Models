module test(o,i1,i2);
input i1,i2;
output [1:0] o;
wire x;
buf(pull1, weak0) g1(o[1],i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o[0],i2); // Drives pull '1', weak '0'
initial begin
  $display("%b",o);
  $display("%b",o[*1]); // Range check error due to insufficient range
end
endmodule
### Output:
X
### Analysis:
Output X due to insufficient range specification in the initial block.