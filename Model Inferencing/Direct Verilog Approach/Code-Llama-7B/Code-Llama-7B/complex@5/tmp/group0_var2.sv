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
initial #30 $stop; // Stop simulation
endmodule
### Simulation Output:
```
sim> ghdl -r tst_or_gate --vcd=tst_or_gate.vcd
tst_or_gate.vhdl:25:9:@0ms:(report note): t=0, en = 0, a = 0000, b = 0
tst_or_gate.vhdl:25:9:@10ns:(report note): t=10, en = 0, a = 0000, b = 0
tst_or_gate.vhdl:25:9:@20ns:(report note): t=20, en = 0, a = 0001, b = 1
tst_or_gate.vhdl:25:9:@30ns:(report note): t=30, en = 0, a = 0010, b = 1
tst_or_gate.vhdl:25:9:@40ns:(report note): t=40, en = 0, a = 0011, b = 1
tst_or_gate.vhdl:25:9:@50ns:(report note): t=50, en = 0, a = 0100, b = 1
tst_or_gate.vhdl:25:9:@60ns:(report note): t=60, en = 0, a = 0101, b = 1
tst_or_gate.vhdl:25:9:@70ns:(report note): t=70, en = 0, a = 0110, b = 1
tst_or_gate.vhdl:25:9:@80ns:(report note): t=80, en = 0, a = 0111, b = 1
tst_or_gate.vhdl:25:9:@90ns:(report note): t=90, en = 0, a = 1000, b = 1
tst_or_gate.vhdl:25:9:@100ns:(report note): t=100, en = 0, a = 1001, b = 1
tst_or_gate.vhdl:25:9:@110ns:(report note): t=110, en = 0, a = 1010, b = 1
tst_or_gate.vhdl:25:9:@120ns:(report note): t=120, en = 0, a = 1011, b = 1
tst_or_gate.vhdl:25:9:@130ns:(report note): t=130, en = 0, a = 1100, b = 1
tst_or_gate.vhdl:25:9:@140ns:(report note): t=140, en = 0, a = 1101, b = 1
tst_or_gate.vhdl:25:9:@150ns:(report note): t=150, en = 0, a = 1110, b = 1
tst_or_gate.vhdl:25:9:@160ns:(report note): t=160, en = 0, a = 1111, b = 1
tst_or_gate.vhdl:25:9:@170ns:(report note): t=170, en = 0, a = 1000, b = 1
tst_or_gate.vhdl:2