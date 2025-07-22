module tst_nor3NMOS();
  parameter N = 3; // Number of inputs
  reg [N-1:0] in;
  wire b;
  generate
    genvar i; // Generic variable
    nor3NMOS u_nor3NMOS (in, b);
    for (i = 0; i < $size(in); i++) begin : gen_block1
      norNMOS u_nor (in[i], b);
    end
  endgenerate
  initial begin // Initialize inputs
    in=3'b0;
  end
  // Toggle inputs at different rates
  always #2 in[0]=~in[0];
  always #3 in[1]=~in[1];
  always #5 in[2]=~in[2];
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in[0],in[1],in[2],b);
  initial #24 $stop; // Stop simulation
endmodule