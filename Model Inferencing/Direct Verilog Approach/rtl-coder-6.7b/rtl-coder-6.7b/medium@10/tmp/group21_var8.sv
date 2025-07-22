modified code:
module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // INSTANTIATE NMOS INVERTER
  initial
    in =1'b1; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule
### Function and case:
function logic  [1:0] find_in_out(input logic in);
  logic [1:0] find_in_out;
  find_in_out = table[1][in][0]?2'b01:table[0][in][0]?2'b10:in?2'b00:2'b11;
  return find_in_out;
endfunction
case(find_in_out(in))
2'b00: out=0;
2'b01: out=1;
2'b10: out=0;
2'b11: out=1;
default: out=0;
endcase
### Array:
logic [1:0] table[2][1:0];
table[1][0] = 2'b01;
table[1][1] = 2'b10;
table[0][0] = 0;
table[0][1] = 0;
### Code:
module tst_nm_in();
  reg in; wire out;
  function logic [1:0] find_in_out(input logic in);
    logic [1:0] find_in_out;
    find_in_out = table[1][in][0]?2'b01:table[0][in][0]?2'b10:in?2'b00:2'b11;
    return find_in_out;
  endfunction
  initial in=1;
  always@(in)
    case(find_in_out(in))
      2'b00: out=0;
      2'b01: out=1