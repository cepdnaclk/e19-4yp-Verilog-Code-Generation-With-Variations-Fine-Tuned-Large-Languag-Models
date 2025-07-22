module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
always @(posedge Clock)
begin
    int index = 0;
    while(index < 10) begin
        Q1 <= array[index++];
        index = index + 1;
    end
    Q2 <= ~Q1;
end
endmodule
### Verification Code:
```verilog
module example7_4_tb;
reg D, Clock, Q1, Q2;
wire Clock;
initial begin
	Clock = 1;
end
always #20 Clock = ~Clock;
initial D = 0;
initial begin
	repeat (10) @(posedge Clock)
	D = ~D;
end
example7_4 dut(D, Clock, Q1, Q2);
endmodule
```