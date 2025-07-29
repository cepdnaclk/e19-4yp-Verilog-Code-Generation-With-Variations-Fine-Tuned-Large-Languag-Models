module counter( input clk, input rst, output reg[3:0] counter);

initial counter = 4'b1111;

always @(posedge clk)
begin
if (rst) counter <= 4'b0000;       // Default output is 0
else counter <= counter + 1;      // Increment counter
end

endmodule

### Base Code:
module counter( input clk, input rst, output reg[3:0] counter);

always