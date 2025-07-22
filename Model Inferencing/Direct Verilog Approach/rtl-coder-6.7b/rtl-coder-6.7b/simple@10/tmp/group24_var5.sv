module Anding (input a, b, output y);
and (y, a, b);
endmodule

module DFF(input a, b, output y);

  struct packed {
    logic x;
    logic y;
  } a_and_b;
  and #1 anding (a_and_b.x, a, b);
  assign y = a_and_b.y;
endmodule