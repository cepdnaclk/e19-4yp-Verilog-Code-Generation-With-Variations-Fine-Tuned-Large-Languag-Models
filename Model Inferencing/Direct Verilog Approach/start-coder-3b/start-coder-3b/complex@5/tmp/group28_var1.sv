module tstdlatch; //test-bench
import `Tstdlatch_pkg::*;
reg d,en;
wire q,qb;
// `Tstdlatch` ff(en,d,q,qb); // Assuming instantiation of a D latch module
initial
begin
d = 1'b0;
en = 1'b0; // Latch disabled
end
always #4 en =~en; // Enable toggles every 4 time units
always #8 d=~d; // Data toggles every 8 time units

always @ (posedge en)
begin // Newly added
state = inside(state, {0,1});
end
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule

# References:

##### 
###### Researcher

My research interests include hardware/software interface design, distributed computing, and high performance computing.