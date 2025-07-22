module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
parameter N=4;
reg [3:0] Q[N-1:0];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        #1
        Q <= D;
endmodule
### Result:
![result](https://user-images.githubusercontent.com/8025855/31681621-51b9b61c-b346-11e7-8a63-5815b25b2d8c.png)