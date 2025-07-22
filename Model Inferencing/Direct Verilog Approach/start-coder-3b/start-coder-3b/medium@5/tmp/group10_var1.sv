module dff_new(D, Clock, Resetn, Q_new);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q_new;
reg [3:0] Q_new;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q_new = 4'b0000;
    else
        Q_new = D;
endmodule
### Simulation Result:
<img src="figures/verilog/dff_new.png" width="50%" height="50%">
### Testbench Code:
`tb_dff_new.v`:
```verilog
reg D, Clock, Resetn, Q_new;

initial begin
    D = 0;
    Clock = Resetn = 1;
end

reg [3:0] Q_new_expected;

initial begin
    Q_new_expected[4'b1001] = 4'b0000;
    Q_new_expected[4'b1010] = 4'b0010;
    Q_new_expected[4'b1011] = 4'b0011;
    Q_new_expected[4'b1100] = 4'b0100;
    Q_new_expected[4'b1101] = 4'b0101;
    Q_new_expected[4'b1110] = 4'b0110;
    Q_new_expected