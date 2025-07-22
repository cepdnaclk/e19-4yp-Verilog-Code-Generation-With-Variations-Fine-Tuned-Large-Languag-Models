module example7_10(Clock, Reset, R, D, Q_out);
output Q_out;
reg Q_out;
always @(posedge Clock or posedge Reset)
begin
    if (R)
        Q_out <= D;
    else
        Q_out <= 0;
end
endmodule