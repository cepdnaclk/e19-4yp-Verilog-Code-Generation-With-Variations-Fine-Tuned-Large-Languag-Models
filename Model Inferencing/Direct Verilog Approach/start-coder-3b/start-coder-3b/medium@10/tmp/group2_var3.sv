module example7_11(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
always @(posedge Clock)
begin
    Q1 <= D;
    D = D;
end
endmodule
### Variation Results:
• The results have successfully been unpacked as expected.

![example7_11_unpack](https://user-images