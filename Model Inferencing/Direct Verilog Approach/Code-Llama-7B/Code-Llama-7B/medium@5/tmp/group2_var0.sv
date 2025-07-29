module example7_6_s(D, Clock, Q);
input D, Clock;
output Q;
reg Q;
reg 	[7:0] 	array [7:0];
always @(posedge Clock)
begin
    Q <= array[0];
    while (array[i] > 0)
        with (array[i])
            array[i] <= array[i] + 1;
end
endmodule
//Example 7.7
### Base Verilog Code:
module example7_7(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q