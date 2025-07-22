```
module maj3 (a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3;
and #(2, 4)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(3, 5) (y, im1, im2, im3);
endmodule
module maj3_test (input clk, input [3:0] a, output y);
reg [3:0] test_data[];
initial begin
    test_data = '{1,2,3,4,5,6,7,8,9,10};
end
always @(posedge clk) begin
    a = test_data[1];
end
maj3 m1 (.a(a[2:1]),.b(a[1]),.c(a[0]),.y(y));
endmodule
```