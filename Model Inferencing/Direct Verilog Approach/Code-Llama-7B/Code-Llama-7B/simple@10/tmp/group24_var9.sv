module Anding (input logic a_tmp, b_tmp, output logic y_tmp);
  logic a_tmp2, b_tmp2;
  union packed {
    logic [31:0] a;
    logic [15:0] b;
    logic [7:0] c;
    logic [3:0] d;
    logic [2:0] e;
  } u;

  always @(a_tmp, b_tmp) begin
    u.a = a_tmp;
    u.b = b_tmp;
    a_tmp2 = u.a;
    b_tmp2 = u.b;
  end

  df