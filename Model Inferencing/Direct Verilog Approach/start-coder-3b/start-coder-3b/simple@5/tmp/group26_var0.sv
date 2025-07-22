module gad1(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
endmodule
### Expected Output:
module gad1(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output {a1,c1};
endmodule
### Verilog Run Output:
module gad1(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output {