module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
    int index = 0;
    while (index < 2) begin
        Q2[index] <= D;
        index = index + 1;
    end
end
endmodule