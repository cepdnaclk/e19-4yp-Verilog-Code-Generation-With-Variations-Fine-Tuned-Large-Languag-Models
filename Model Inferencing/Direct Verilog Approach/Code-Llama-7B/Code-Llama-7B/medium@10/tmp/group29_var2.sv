module test();
reg [2:0] arr [3:0];
reg [2:0] c, d, e, f, g;
always @*
    begin
        c = arr[0];
        d = arr[1];
        e = arr[2];
        f = arr[3];
        g = arr[4];
    end
muxdff m0 (c[0], d[0], 1'b1, g[0], Q0);
muxdff m1 (c[1], d[1], 1'b1, g[1], Q1);
muxdff m2 (c[2], d[2], 1'b1, g[2], Q2);
endmodule
### Original Code:
module test();
reg [2:0] arr [3:0];
reg [2:0]