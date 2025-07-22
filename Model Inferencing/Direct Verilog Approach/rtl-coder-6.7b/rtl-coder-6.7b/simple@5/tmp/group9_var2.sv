module Problem8(input [3:0] a, b, output [3:0] diff);
  typedef struct packed {
    logic [1:0] x;
    logic       y;
    logic       z;
  } my_struct;

  my_struct [3:0] a_struct;
  my_struct [3:0] b_struct;
  my_struct [3:0] diff_struct;

  assign a_struct = '{x: a[3:2], y: a[1], z: a[0]};
  assign b_struct = '{x: b[3:2], y: b[1], z: b[0]};
  assign diff_struct.x = a_struct.x - b_struct.x;
  assign diff_struct.y = &diff_struct.x? ~&diff_struct.x : a_struct.y & ~b_struct.y;
  assign diff_struct.z = &diff_struct.x? 1'b0 : |diff_struct.x? diff_struct.y : a_struct.z & ~b_struct.z;

  assign diff[3:2] = diff_struct.x;
  assign diff[1]   = diff_struct.y;
  assign diff[0]   = diff_struct.z;
endmodule