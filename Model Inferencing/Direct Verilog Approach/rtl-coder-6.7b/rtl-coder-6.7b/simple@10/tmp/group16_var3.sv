`logic [15:0] DataIn; // Packet Data to be transmitted
string DataOut; // Transmitted Data`
### Testbench Code:
module orfr_tst_str; // Testbench for OR gate with force/release
  parameter WIDTH=16;
  reg [WIDTH-1:0] b,c; wire [WIDTH-1:0] a;
  initial begin b='{default:1'b0}; c='{default:1'b0}; #20 $stop; end
  always #3 c = ~c;
  or_fr_rl #(.WIDTH(WIDTH)) dd (a,b,c);
endmodule