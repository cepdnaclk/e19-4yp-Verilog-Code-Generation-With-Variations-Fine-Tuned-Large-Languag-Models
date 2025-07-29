module func1(x1, x2, x3, f_signed);
input x1, x2, x3;
output signed logic f_signed;
assign f_signed = (signed'({x1,1}) & signed'({~x2,1}) & signed'({x3,1})) | (signed'({x1,1}) & signed'({x2,1}) & signed'({~x3,1})) | (signed'({~x1,1}) & signed'({~x2,1}) & signed'({x3,1})) | (signed'({~x1,1}) & signed'({x2,1}) & signed'({~x3,1}));
endmodule
### Testing:
*