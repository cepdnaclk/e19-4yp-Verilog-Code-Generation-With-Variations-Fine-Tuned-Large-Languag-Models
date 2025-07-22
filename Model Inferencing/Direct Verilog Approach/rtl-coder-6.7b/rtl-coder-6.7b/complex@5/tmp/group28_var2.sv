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
endmodule

package pkg;
localparam [1:0] P0 = 2'b00, P1 = 2'b01;
endpackage

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

package pkg;
localparam [1:0] P0 = 2'b00, P1 = 2'b01;
endpackage

module dlatch
(input en,d, output reg q,output reg qb);
// dlatch ff(en,d,q,qb); // Assuming instantiation of a D latch module
import pkg::*;
reg [1:0] state;
always @(posedge en or posedge d) begin
case (state)
P0: if (en) state <= P1;
P1: if (~en) state <= P0;
default: state <= P0;
endcase
end
assign q = (state == P1);
assign qb = ~q;
endmodule
```