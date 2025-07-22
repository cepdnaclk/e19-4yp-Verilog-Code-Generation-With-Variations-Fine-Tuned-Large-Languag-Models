module counter(output[3:0]q,input[3:0]d,clk,rst);
reg [3:0]q;
always@(posedge rst or posedge clk)
case(d)
4'b0001:q<=4'b0000