module maj3(a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3;
wire [] [2:0] input = {a, b, c};
and #(2, 4) (im1, input[1], input[2]);
and #(2, 4) (im2, input[0], input[2]);
and #(2, 4) (im3, input[0], input[1]);
or #(3, 5) (y, im1, im2, im3);
endmodule
### Instruction in Verilator:

* `XMR 2:4:2 6:0,y,im1,im2,im3`
* `ALW AND 2:4 6:0: 0 0`
* `ALW AND 2:4 6:0: 0 1`
* `ALW AND 2:4 6:0: 1 0`
* `ALW AND 2:4 6:0: 1 1`
* `ALW OR 3:5 6:0: 2:0 2:1 2:2` ### Test Result:

Test was passed
##