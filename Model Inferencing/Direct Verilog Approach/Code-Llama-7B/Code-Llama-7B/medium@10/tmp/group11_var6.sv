module mux4to1(z,x1,x2,x3,x4);
output z;
input x1,x2,x3,x4;
wire y1,y2,y3;
assign y1 = x1 || x2;
assign y2 = x3 || x4;
assign y3 = x1 && x3;

initial
some_var = some_fun(x1,x2,x3,x4);

assign z = (y1 && x4) || (y2 && y3) || (y1 && y2);

endmodule

### Expected Output:
z = (y1 && x4) || (y2 && y3) || (y1 && y2);

### Final Output:
z = (y1