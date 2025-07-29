```verilog
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
module dlatch(en,d,q,qb); // Assuming instantiation of a D latch module
reg en,d;
wire q,qb;
always @ (en,d)
begin
    if (en)
      case (state)
        WAIT:   if (d == 0) 
                 begin 
                 state <= FLUSH_P0_P1; 
                 q <= 0; 
                 qb <= 1; 
                 end
                 else 
                 begin 
                 state <= FLUSH_P0_P1; 
                 q <= 1; 
                 qb <= 0; 
                 end
        
        FLUSH_P0_P1: begin 
                 state <= WAIT; 
                 end
      endcase
    else
      begin
        state <= WAIT; 
        q <= 1; 
        qb <= 0;
      end
end
initial state = WAIT;
endmodule
package pack;
localparam WAIT = 2'b00;
localparam FLUSH_P0_P1 = 2'b01;
localparam FLUSH_P1