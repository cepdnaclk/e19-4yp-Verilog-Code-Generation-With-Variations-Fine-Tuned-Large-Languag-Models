module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule
module muxdff_testbench();
reg D0, D1, Sel, Clock;
wire Q;
reg [7:0] a[0:255];
reg [7:0] j;
integer i;
integer k;
integer jj;
integer kk;
integer ii;
integer jjj;
integer kkk;
integer iii;
integer jjjj;
integer kkkk;
integer iiii;
integer jjjjj;
integer kkkkk;
integer iiiii;
integer jjjjjj;
integer kkkkkk;
integer iiiiii;
integer jjjjjjj;
integer kkkkkkk;
integer iiiiiii;
integer jjjjjjjj;
integer kkkkkkkk;
integer iiiiiiii;
integer jjjjjjjjj;
integer kkkkkkkkk;
initial begin
    for (i = 0; i <= 255; i = i + 1) begin
        a[i] = i;
    end
    i = 0;
    k = 0;
    j = 0;
    Clock = 1;
    while (i < 256) begin
        #10;
        if (a[k] == j) begin
            Sel = 0;
            D0 = a[k];
            k = k + 1;
        end
        else begin
            Sel = 1;
            D1 = a[j];
            j = j + 1;
        end
        Clock = 1;
    end
    Sel = 0;
    D0 = a[k];
    while (j < 256) begin
        #10;
        Sel = 1;
        D1 = a[j];
        j = j + 1;
        Clock = 1;
    end
    Sel = 0;
    while (k < 256) begin
        #10;
        Sel = 0;
        D0 = a[k];
        k = k + 1;
        Clock = 1;
    end
    $display("DONE!");
end
endmodule
### Original Code:
module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule
module muxdff_testbench();
reg D0, D1, Sel, Clock;
wire Q;
integer i;
integer j;
integer k;
integer ii;
integer jj;
integer kk;
integer iii;
integer jjj;
integer kkk;
integer iiii;
integer jjjj;
integer kkkk;
integer iiiii;
integer jjjjj;
integer kkkkk;
integer iiiiii;
integer jjjjjj;
integer kkkkkk;
integer iiiiiii;
integer jjjjjjj;
integer kkkkkkk;
integer iiiiiiii;
integer jjjjjjjj;
integer kkkkkkkk;
integer iiiiiiiii;
integer jjjjjjjjj;
integer kkkkkkkkk;
initial begin
    i = 1;
    j = 1;
    k = 1;
    iii = 1;
    jjj = 1;
    kkk = 1;
    iiii = 1;
    jjjj = 1;
    kkkk = 1;
    iiiii = 1;
    jjjjj = 1;
    kkkkk = 1;
    iiiiii = 1;
    jjjjjj =