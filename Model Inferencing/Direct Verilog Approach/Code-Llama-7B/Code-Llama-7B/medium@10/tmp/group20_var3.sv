module Chap1Counter2 (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end
final begin:final1
   $display("Count[0:1] = %b", Count[0:1]);
   Count[0:1] = Count[1:2];
end
endmodule
### Explanation:
The final statement in the module can have more than one procedural statement
inside the final block. The procedural statements can be grouped by logical
flow statements, such as if statements.
### Simulation: