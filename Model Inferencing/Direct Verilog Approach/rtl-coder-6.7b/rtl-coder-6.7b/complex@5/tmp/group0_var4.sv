```
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

```
### Additional Test Cases:
```
a = 4'h1;
a = 4'h2;
a = 4'h4;
a = 4'h8;
a = 4'hc;
a = 4'h0;
a = 4'h3;
a = 4'h5;
a = 4'h6;
a = 4'h7;
a = 4'hf;
```