module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
always @(posedge Clock)
begin
    integer i;
    while(i < 10)
    begin
        i = i + 1;
        Q1 <= D;
        Q2 <= Q1;
    end
end
endmodule
### Output:
```
Writing netlist...
Creating netlist...


File test7_4.v written to disk.
```