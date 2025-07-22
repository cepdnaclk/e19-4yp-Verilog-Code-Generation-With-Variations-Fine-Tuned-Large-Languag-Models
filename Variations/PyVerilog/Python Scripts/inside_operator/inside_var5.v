

module sub_module
(

);

  reg [7:0] values [3:0];

  initial begin
    values[0] = 100;
    values[1] = 110;
    values[2] = 120;
    values[3] = 130;
  end


endmodule



module inside_var5
(
  input [7:0] A,
  output X
);

  reg X;

  sub_module
  inst
  (
  );

  assign X = (A == inst.values[0]) || (A == inst.values[1]) || (A == inst.values[2]) || (A == inst.values[3]);

endmodule

