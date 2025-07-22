[Source](https://github.com/zipFile01/Verilog_TestBENCH/tree/master/Source/D_Latch/D_Latch_02/D_Latch_02.v)
```
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

// add inside check for state

always @(posedge clock)
begin
case(state)
0: begin
if(en)begin
q = d;
qb = d;
en = 1'b0;
end
else begin
q = qb;
end
end
1: begin
if(d)begin
q = 1'b1;
qb = 1'b1;
end
else begin
q = qb;
end
end
endcase
end

endmodule
```

### Expected Output:
```
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 1, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0 
en = 0, d = 0, q = 0, qb = 0