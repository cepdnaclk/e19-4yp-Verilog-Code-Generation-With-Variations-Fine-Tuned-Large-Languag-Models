```
// Modified tst_or_gate.v module tst_or_gate();

// Add the following code in module scope
// inside a;
// begin
//   if (a[0]<=0x1 && a[3]>=0x1)
//   $display("a is within range 0x1 to 0x1");
// end

reg[3:0]a;
reg en;
wire b;
or_gate gg(b,a,en);

initial
begin
a = 4'h0; // Initialize input
en = 1'b0; // Initialize enable
end

initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial #