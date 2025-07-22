module tst_or_gate();
reg[3:0]a;
reg en;
wire b;
or_gate gg(b,a,en);
initial
begin
foreach(a[k])a[k] = 4'h0; // Initialize input
en = 1'b0; // Initialize enable
end
initial begin // Stimulus generation
end
initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial #30 $stop; // Stop simulation
endmodule