module tstdlatch; //test-bench
reg d,en;
wire q,qb;
// dlatch ff(en,d,q,qb); // Assuming instantiation of a D latch module
initial
begin
d = 1'b0;
en = 1'b0; // Latch disabled
end
always #4 en =~en; // Enable toggles every 4 time units
always #8 d=~d; // Data toggles every 8 time units
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule
module dlatch (en,d,q,qb);
input d,en;
output q,qb;
reg q,qb;
always begin
if(en)
begin
q <= d;
qb <= ~d;
end
else
qb <= 1'bx;
q <= 1'bx;
end
endmodule