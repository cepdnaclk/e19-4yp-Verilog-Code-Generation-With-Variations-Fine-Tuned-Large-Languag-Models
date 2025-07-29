module muxdff_tb();
wire D0, D1, Q;
reg Clock;
reg Sel;
initial begin
    Clock = 0;
    #150 $finish;
end
always #5 Clock = ~Clock;
initial begin
    D0 = 1'b1;
    D1 = 1'b0;
    Sel = 0;
    #100 $finish;
end
module muxdff_tb();
wire D0, D1, Q;
reg Clock;
reg Sel;
initial begin
    integer i;
    D0 = 1'b0;
    D1 = 1'b0;
    Sel = 1'b0;
    Clock = 0;
    while (i < 4)
    begin
        Sel = i;
        i = i + 1;
    end
    Clock = 1'b1;
end
always #5 Clock = ~Clock;
muxdff MUX(D0, D1, Sel, Clock, Q);
endmodule
### Verification:
![](./imgs/muxd