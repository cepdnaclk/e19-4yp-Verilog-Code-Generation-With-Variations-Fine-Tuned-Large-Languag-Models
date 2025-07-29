module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;

//Generate
generate for(i=0;i<4;i=i+1)
begin
if (i==0) begin
    assign f = x1 & x2;
end
if (i==1) begin
    assign f = f & x2;
end
if (i==2) begin
    assign f = f & x3;
end
end
endgenerate
assign g = f | x3;
endmodule
### Screenshot (Before):
![image](../pics/variation_example7_5_before.png)
### Screenshot (After):
![image](../pics/variation_example7_5_after.png)
### Simulation Result (before):
![image](../pics/variation_example7_5_before_sim.png)
### Simulation Result (after):
![image](../pics