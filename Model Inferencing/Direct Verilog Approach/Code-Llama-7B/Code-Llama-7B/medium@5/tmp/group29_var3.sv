module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
int i;
always @(posedge Clock)
    if (!Sel)
        Q[i] <= D0[i];
    else
        Q[i] <= D1[i];
endmodule
### Source Code:
```verilog
module muxdff (
    input [5:0] D0, D1, Sel,
    input Clock,
    output reg [5:0] Q
);

always @(posedge Clock)
    if (!Sel)
        Q[i] <= D0[i];
    else
        Q[i] <= D1[i];
endmodule
```
### Test Code:
```verilog
reg Clock;
reg [5:0] D0 = 0, D1 = 0, Sel = 0;
wire [5:0] Q;
muxdff UUT1 (D0, D1, Sel, Clock, Q);
initial
begin
    Clock = 0;
    forever
        #10 Clock = ~Clock;
end
initial
begin
    Sel = 1;
    #15
    D0 = 6'b101001;
    D1 = 6'b010110;
    #15
    Sel = 0;
    #15
    Sel = 1;
    #20
    $finish;
end
initial
begin
    $monitor("%d, %b, %b, %b", $time, D0, D1, Q);
end
initial
begin
    #20
    $monitor("Sel=0, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #22
    $monitor("Sel=1, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #24
    $monitor("Sel=0, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #26
    $monitor("Sel=1, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #28
    $monitor("Sel=0, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #30
    $monitor("Sel=1, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #32
$monitor("Sel=0, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #34
    $monitor("Sel=1, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #36
    $monitor("Sel=0, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #38
    $monitor("Sel=1, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #40
    $monitor("Sel=0, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #42
    $monitor("Sel=1, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #44
    $monitor("Sel=0, D0=%b, D1=%b, Q=%b", Sel, D0, D1, Q);
end
initial
begin
    #46
    $monitor("Sel=1