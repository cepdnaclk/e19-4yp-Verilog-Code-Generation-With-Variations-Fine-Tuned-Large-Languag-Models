module tstdlatch; //test-bench
reg d,en;
wire q,qb;
// dlatch ff(en,d,q,qb); // Assuming instantiation of a D latch module
reg [1:0] state;
initial
begin
d = 1'b0;
state = 2'b00;
en = 1'b0; // Latch disabled
end
always #4 state = 2'b00;
always #4 en = ~state[0];
always #4 d = ~state[1];
always $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
always @(state) begin
if ($realtime >= 40) $stop; end else begin
if (state == 2'b00) state = 2'b01;
else if (state == 2'b01) state = 2'b10;
else if (state == 2'b10) state = 2'b00;
end
endmodule
### Trace Output:
 en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 1, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 1, d = 0, q = 1, qb = 1  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0 en = 0, d = 0, q = 0, qb = 0 en = 0, d = 0, q = 0, qb = 0 en = 0, d = 0, q = 0, qb = 0 en = 0, d = 0, q = 0, qb = 0 en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 1, d = 0, q = 1, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 1, d = 1, q = 0, qb = 1  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 0, d = 0, q = 0, qb = 0  en = 1, d = 0, q = 1, qb = 1  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 1, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 1, d = 1, q = 0, qb = 0  en = 1, d =