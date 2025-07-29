module DFF (input a, b, output y);
wire y;
reg [3:0] x;
always @ (posedge a)
x <= x + 1;
assign y = x[3:0];
endmodule
### Other Instructions: