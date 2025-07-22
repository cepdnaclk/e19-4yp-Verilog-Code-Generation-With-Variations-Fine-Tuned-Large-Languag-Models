[and_gate.v](src/and_gate.v) (Click to view)
### Testbench Code:
[tb_and_gate.v](src/tb_and_gate.v) (Click to view)
### Simulation Output:

```
[...]
t=100, en = b'1, a = h'0, b = b'0
t=120, en = b'1, a = h'0, b = b'0
t=140, en = b'1, a = h'0, b = b'0
t=160, en = b'1, a = h'0, b = b'0
```

## 9.39

### Base Verilog Code:
module tst_or_gate();
reg[3:0]a;
reg en;
wire b;
or_gate gg(b,a,en);
initial
begin
a = 4'h0; // Initialize input
en = 1'b0; // Initialize enable
end
initial begin // Stimulus generation
end
initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial #30 $