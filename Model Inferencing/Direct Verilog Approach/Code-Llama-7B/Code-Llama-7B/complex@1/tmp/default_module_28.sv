```vhdl
module tstdlatch; //test-bench
reg d,en;
wire q,qb;
// dlatch ff(en,d,q,qb); // Assuming instantiation of a D latch module
// initial
// begin
// d = 1'b0; // Latch enabled
// en = 1'b0; // Latch disabled
// end
always #4 en =~en; // Enable toggles every 4 time units
always #8 d=~d; // Data toggles every 8 time units
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule

// dlatch package
package dlatch_pkg;
parameter [2:0] P0 = 3'b000;
parameter [2:0] P1 = 3'b001;
parameter [2:0] P2 = 3'b010;
parameter [2:0] P3 = 3'b011;
parameter [2:0] P4 = 3'b100;
parameter [3:0] STATE_END = 4'b0111;
parameter [3:0] STATE_FLUSH = 4'b1000;

typedef enum logic [2:0] {
inside=P0,P1,P2,P3,P4
} states;
endpackage

// dlatch testbench
module tstdlatch; //test-bench
reg d,en;
wire q,qb;
dlatch ff(en,d,q,qb); // Assuming instantiation of a D latch module
initial
begin
d = 1'b0; // Latch enabled
en = 1'b0; // Latch disabled
end
always #4 en =~en; // Enable toggles every 4 time units
always #8 d=~d; // Data toggles every 8 time units
initial $monitor($time," en = %b, d = %b, q = %b